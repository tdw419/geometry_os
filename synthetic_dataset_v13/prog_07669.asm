; DESCRIPTION: Composite: Places a orange circle of radius 79 at center (393, 114) then Draws a purple line from (35, 185) to (511, 168).
; PLAN: r0=393(x), r1=114(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x1), r6=185(y1), r7=511(x2), r8=168(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 114
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 185
LDI r7, 511
LDI r8, 168
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
