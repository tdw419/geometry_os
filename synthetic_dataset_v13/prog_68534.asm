; DESCRIPTION: Draws a green line from (137, 6) to (235, 80).
; PLAN: r0=137(x1), r1=6(y1), r2=235(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 6
LDI r2, 235
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
