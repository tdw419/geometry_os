; DESCRIPTION: Composite: Renders a black box of size 47x71 starting at (2, 20) then Sets a single purple pixel at (29, 45) then Places a blue line segment connecting (504, 94) to (447, 60).
; PLAN: r0=2(x), r1=20(y), r2=47(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x), r6=45(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=504(x1), r11=94(y1), r12=447(x2), r13=60(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 20
LDI r2, 47
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 45
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 504
LDI r11, 94
LDI r12, 447
LDI r13, 60
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
