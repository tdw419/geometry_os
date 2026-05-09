; DESCRIPTION: Draws a purple line from (388, 75) to (25, 19).
; PLAN: r0=388(x1), r1=75(y1), r2=25(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 75
LDI r2, 25
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
