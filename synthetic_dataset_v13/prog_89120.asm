; DESCRIPTION: Composite: Sets a single blue pixel at (366, 215) then Places a purple circle of radius 39 at center (132, 61) then Places a purple line segment connecting (100, 232) to (412, 162).
; PLAN: r0=366(x), r1=215(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=61(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x1), r11=232(y1), r12=412(x2), r13=162(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 215
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 61
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 232
LDI r12, 412
LDI r13, 162
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
