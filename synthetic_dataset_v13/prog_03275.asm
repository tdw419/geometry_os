; DESCRIPTION: Draws a purple line from (258, 35) to (458, 162).
; PLAN: r0=258(x1), r1=35(y1), r2=458(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 35
LDI r2, 458
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
