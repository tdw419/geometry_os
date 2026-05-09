; DESCRIPTION: Draws a purple line from (390, 221) to (31, 107).
; PLAN: r0=390(x1), r1=221(y1), r2=31(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 221
LDI r2, 31
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
