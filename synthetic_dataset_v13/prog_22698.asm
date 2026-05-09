; DESCRIPTION: Draws a purple line from (1, 75) to (178, 11).
; PLAN: r0=1(x1), r1=75(y1), r2=178(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 75
LDI r2, 178
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
