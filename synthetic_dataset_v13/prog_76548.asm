; DESCRIPTION: Draws a purple line from (248, 1) to (324, 199).
; PLAN: r0=248(x1), r1=1(y1), r2=324(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 1
LDI r2, 324
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
