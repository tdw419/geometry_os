; DESCRIPTION: Draws a yellow line from (351, 141) to (81, 145).
; PLAN: r0=351(x1), r1=141(y1), r2=81(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 141
LDI r2, 81
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
