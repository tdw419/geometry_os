; DESCRIPTION: Composite: Sets a single blue pixel at (494, 9) then Renders a cyan disk with center (142, 132) and radius 63 then Creates a white rectangular region at (390, 100) spanning 40 by 62 pixels.
; PLAN: r0=494(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=132(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x), r11=100(y), r12=40(width), r13=62(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 142
LDI r6, 132
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 100
LDI r12, 40
LDI r13, 62
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
