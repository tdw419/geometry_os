; DESCRIPTION: Draws a yellow line from (229, 198) to (235, 77).
; PLAN: r0=229(x1), r1=198(y1), r2=235(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 198
LDI r2, 235
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
