; DESCRIPTION: Composite: Draws a black rectangle at (68, 38) with width 33 and height 66 then Sets a single white pixel at (484, 194) then Creates a white circular shape at (142, 139) with radius 78.
; PLAN: r0=68(x), r1=38(y), r2=33(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=194(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=142(x), r11=139(y), r12=78(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 68
LDI r1, 38
LDI r2, 33
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 194
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 142
LDI r11, 139
LDI r12, 78
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
