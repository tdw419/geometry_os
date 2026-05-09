; DESCRIPTION: Draws a purple line from (365, 14) to (501, 191).
; PLAN: r0=365(x1), r1=14(y1), r2=501(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 14
LDI r2, 501
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
