; DESCRIPTION: Composite: Places a green line segment connecting (132, 67) to (118, 164) then Places a black circle of radius 52 at center (230, 92) then Sets a single yellow pixel at (193, 69).
; PLAN: r0=132(x1), r1=67(y1), r2=118(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=92(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=193(x), r11=69(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 67
LDI r2, 118
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 92
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 193
LDI r11, 69
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
