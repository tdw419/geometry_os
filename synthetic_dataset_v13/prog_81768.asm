; DESCRIPTION: Draws a purple line from (367, 156) to (5, 121).
; PLAN: r0=367(x1), r1=156(y1), r2=5(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 156
LDI r2, 5
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
