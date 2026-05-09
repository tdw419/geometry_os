; DESCRIPTION: Draws a purple line from (250, 11) to (251, 32).
; PLAN: r0=250(x1), r1=11(y1), r2=251(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 11
LDI r2, 251
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
