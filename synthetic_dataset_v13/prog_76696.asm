; DESCRIPTION: Composite: Sets a single blue pixel at (432, 159) then Draws a purple line from (505, 4) to (311, 32) then Renders a cyan disk with center (312, 146) and radius 63.
; PLAN: r0=432(x), r1=159(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=505(x1), r6=4(y1), r7=311(x2), r8=32(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=146(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 432
LDI r1, 159
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 505
LDI r6, 4
LDI r7, 311
LDI r8, 32
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 146
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
