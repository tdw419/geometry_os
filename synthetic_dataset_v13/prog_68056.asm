; DESCRIPTION: Draws a purple line from (196, 75) to (248, 4).
; PLAN: r0=196(x1), r1=75(y1), r2=248(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 75
LDI r2, 248
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
