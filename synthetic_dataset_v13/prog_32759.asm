; DESCRIPTION: Composite: Places a yellow 25x35 rectangle at position (51, 191) then Renders a blue line between points (273, 165) and (417, 6) then Sets a single purple pixel at (495, 112).
; PLAN: r0=51(x), r1=191(y), r2=25(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x1), r6=165(y1), r7=417(x2), r8=6(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=495(x), r11=112(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 191
LDI r2, 25
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 165
LDI r7, 417
LDI r8, 6
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 495
LDI r11, 112
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
