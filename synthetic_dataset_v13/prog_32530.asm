; DESCRIPTION: Composite: Sets a single purple pixel at (384, 211) then Draws a purple line from (399, 187) to (143, 145) then Places a black circle of radius 36 at center (270, 123).
; PLAN: r0=384(x), r1=211(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=399(x1), r6=187(y1), r7=143(x2), r8=145(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=270(x), r11=123(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 211
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 187
LDI r7, 143
LDI r8, 145
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 123
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
