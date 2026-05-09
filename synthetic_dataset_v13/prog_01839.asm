; DESCRIPTION: Draws a purple line from (254, 118) to (468, 6).
; PLAN: r0=254(x1), r1=118(y1), r2=468(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 118
LDI r2, 468
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
