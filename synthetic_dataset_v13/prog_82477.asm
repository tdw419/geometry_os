; DESCRIPTION: Draws a purple line from (208, 14) to (78, 84).
; PLAN: r0=208(x1), r1=14(y1), r2=78(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 14
LDI r2, 78
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
