; DESCRIPTION: Composite: Places a black 90x73 rectangle at position (243, 136) then Sets a single blue pixel at (430, 92) then Places a blue circle of radius 35 at center (338, 105).
; PLAN: r0=243(x), r1=136(y), r2=90(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=105(y), r12=35(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 136
LDI r2, 90
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 338
LDI r11, 105
LDI r12, 35
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
