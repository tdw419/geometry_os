; DESCRIPTION: Draws a blue line from (402, 235) to (212, 15).
; PLAN: r0=402(x1), r1=235(y1), r2=212(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 235
LDI r2, 212
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
