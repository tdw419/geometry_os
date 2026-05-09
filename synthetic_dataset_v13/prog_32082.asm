; DESCRIPTION: Composite: Places a black line segment connecting (111, 64) to (378, 236) then Sets a single purple pixel at (210, 35) then Renders a green box of size 51x37 starting at (432, 216).
; PLAN: r0=111(x1), r1=64(y1), r2=378(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=35(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=432(x), r11=216(y), r12=51(width), r13=37(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 64
LDI r2, 378
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 35
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 432
LDI r11, 216
LDI r12, 51
LDI r13, 37
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
