; DESCRIPTION: Draws a purple line from (79, 243) to (155, 241).
; PLAN: r0=79(x1), r1=243(y1), r2=155(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 243
LDI r2, 155
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
