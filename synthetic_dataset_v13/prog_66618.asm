; DESCRIPTION: Draws a blue line from (375, 14) to (235, 229).
; PLAN: r0=375(x1), r1=14(y1), r2=235(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 14
LDI r2, 235
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
