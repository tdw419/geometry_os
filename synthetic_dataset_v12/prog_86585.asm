; DESCRIPTION: Composite: Places a yellow dot at position (355, 75) then Creates a white circular shape at (206, 194) with radius 62 then Creates a orange rectangular region at (8, 15) spanning 56 by 93 pixels.
; PLAN: r0=355(x), r1=75(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=194(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=15(y), r12=56(width), r13=93(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 75
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 206
LDI r6, 194
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 15
LDI r12, 56
LDI r13, 93
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
