; DESCRIPTION: Composite: Renders a purple line between points (216, 45) and (167, 162) then Sets a single blue pixel at (7, 103) then Draws a cyan circle centered at (455, 79) with radius 49.
; PLAN: r0=216(x1), r1=45(y1), r2=167(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=103(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=455(x), r11=79(y), r12=49(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 216
LDI r1, 45
LDI r2, 167
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 103
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 455
LDI r11, 79
LDI r12, 49
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
