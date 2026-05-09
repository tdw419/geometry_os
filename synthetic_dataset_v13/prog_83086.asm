; DESCRIPTION: Draws a yellow line from (183, 15) to (483, 110).
; PLAN: r0=183(x1), r1=15(y1), r2=483(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 15
LDI r2, 483
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
