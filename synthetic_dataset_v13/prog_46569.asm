; DESCRIPTION: Composite: Renders a orange disk with center (264, 140) and radius 74 then Sets a single green pixel at (77, 243) then Creates a magenta rectangular region at (477, 33) spanning 30 by 23 pixels.
; PLAN: r0=264(x), r1=140(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=243(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=477(x), r11=33(y), r12=30(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 140
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 243
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 477
LDI r11, 33
LDI r12, 30
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
