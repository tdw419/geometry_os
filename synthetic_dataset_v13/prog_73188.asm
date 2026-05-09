; DESCRIPTION: Composite: Renders a blue box of size 105x19 starting at (33, 15) then Sets a single yellow pixel at (261, 217) then Creates a white circular shape at (365, 107) with radius 23.
; PLAN: r0=33(x), r1=15(y), r2=105(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=217(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=365(x), r11=107(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 15
LDI r2, 105
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 217
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 365
LDI r11, 107
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
