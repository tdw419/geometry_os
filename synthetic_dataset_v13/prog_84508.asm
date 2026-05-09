; DESCRIPTION: Draws a purple line from (426, 181) to (229, 3).
; PLAN: r0=426(x1), r1=181(y1), r2=229(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 181
LDI r2, 229
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
