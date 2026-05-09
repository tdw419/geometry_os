; DESCRIPTION: Composite: Renders a black box of size 53x110 starting at (200, 107) then Places a purple line segment connecting (497, 230) to (32, 64) then Renders a purple disk with center (432, 137) and radius 41.
; PLAN: r0=200(x), r1=107(y), r2=53(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x1), r6=230(y1), r7=32(x2), r8=64(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=432(x), r11=137(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 107
LDI r2, 53
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 230
LDI r7, 32
LDI r8, 64
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 137
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
