; DESCRIPTION: Composite: Sets a single yellow pixel at (187, 24) then Places a black line segment connecting (430, 232) to (481, 162) then Places a magenta circle of radius 64 at center (316, 74).
; PLAN: r0=187(x), r1=24(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=430(x1), r6=232(y1), r7=481(x2), r8=162(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=74(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 24
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 430
LDI r6, 232
LDI r7, 481
LDI r8, 162
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 74
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
