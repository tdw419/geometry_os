; DESCRIPTION: Draws a purple line from (282, 150) to (13, 250).
; PLAN: r0=282(x1), r1=150(y1), r2=13(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 150
LDI r2, 13
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
