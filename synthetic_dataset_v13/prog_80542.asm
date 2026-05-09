; DESCRIPTION: Draws a purple line from (18, 43) to (468, 218).
; PLAN: r0=18(x1), r1=43(y1), r2=468(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 43
LDI r2, 468
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
