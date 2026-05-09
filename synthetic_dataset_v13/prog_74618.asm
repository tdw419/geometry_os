; DESCRIPTION: Composite: Draws a magenta circle centered at (90, 74) with radius 25 then Renders a white line between points (174, 24) and (296, 251) then Sets a single orange pixel at (432, 147).
; PLAN: r0=90(x), r1=74(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x1), r6=24(y1), r7=296(x2), r8=251(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=432(x), r11=147(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 74
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 24
LDI r7, 296
LDI r8, 251
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 147
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
