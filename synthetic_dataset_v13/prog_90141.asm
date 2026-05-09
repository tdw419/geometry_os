; DESCRIPTION: Draws a yellow line from (448, 140) to (381, 19).
; PLAN: r0=448(x1), r1=140(y1), r2=381(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 140
LDI r2, 381
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
