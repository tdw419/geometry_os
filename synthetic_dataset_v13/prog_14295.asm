; DESCRIPTION: Composite: Renders a yellow disk with center (180, 49) and radius 47 then Draws a purple line from (352, 246) to (170, 181) then Sets a single orange pixel at (37, 115).
; PLAN: r0=180(x), r1=49(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=246(y1), r7=170(x2), r8=181(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=115(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 180
LDI r1, 49
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 246
LDI r7, 170
LDI r8, 181
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 115
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
