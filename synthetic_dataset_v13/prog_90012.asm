; DESCRIPTION: Draws a blue line from (235, 91) to (115, 21).
; PLAN: r0=235(x1), r1=91(y1), r2=115(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 91
LDI r2, 115
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
