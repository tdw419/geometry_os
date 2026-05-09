; DESCRIPTION: Draws a purple line from (78, 150) to (194, 132).
; PLAN: r0=78(x1), r1=150(y1), r2=194(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 150
LDI r2, 194
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
