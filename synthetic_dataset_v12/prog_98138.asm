; DESCRIPTION: Draws a purple line from (304, 176) to (236, 35).
; PLAN: r0=304(x1), r1=176(y1), r2=236(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 176
LDI r2, 236
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
