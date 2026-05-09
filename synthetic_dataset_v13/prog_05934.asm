; DESCRIPTION: Draws a white line from (132, 145) to (282, 157).
; PLAN: r0=132(x1), r1=145(y1), r2=282(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 145
LDI r2, 282
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
