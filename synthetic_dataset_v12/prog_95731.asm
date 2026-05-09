; DESCRIPTION: Draws a purple line from (6, 184) to (57, 80).
; PLAN: r0=6(x1), r1=184(y1), r2=57(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 184
LDI r2, 57
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
