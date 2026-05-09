; DESCRIPTION: Draws a purple line from (179, 117) to (478, 143).
; PLAN: r0=179(x1), r1=117(y1), r2=478(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 117
LDI r2, 478
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
