; DESCRIPTION: Draws a purple line from (204, 197) to (511, 91).
; PLAN: r0=204(x1), r1=197(y1), r2=511(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 197
LDI r2, 511
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
