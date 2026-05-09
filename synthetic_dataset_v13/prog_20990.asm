; DESCRIPTION: Draws a blue line from (145, 78) to (276, 183).
; PLAN: r0=145(x1), r1=78(y1), r2=276(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 78
LDI r2, 276
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
