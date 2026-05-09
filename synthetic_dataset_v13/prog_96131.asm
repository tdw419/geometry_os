; DESCRIPTION: Composite: Places a purple dot at position (362, 182) then Renders a blue box of size 88x94 starting at (180, 14) then Renders a purple disk with center (347, 193) and radius 22.
; PLAN: r0=362(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=14(y), r7=88(width), r8=94(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x), r11=193(y), r12=22(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 182
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 14
LDI r7, 88
LDI r8, 94
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 193
LDI r12, 22
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
