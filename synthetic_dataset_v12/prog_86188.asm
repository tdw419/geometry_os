; DESCRIPTION: Draws a purple line from (509, 159) to (77, 230).
; PLAN: r0=509(x1), r1=159(y1), r2=77(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 159
LDI r2, 77
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
