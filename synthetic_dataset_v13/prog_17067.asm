; DESCRIPTION: Draws a purple line from (89, 241) to (212, 83).
; PLAN: r0=89(x1), r1=241(y1), r2=212(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 241
LDI r2, 212
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
