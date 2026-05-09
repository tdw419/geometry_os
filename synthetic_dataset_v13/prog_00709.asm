; DESCRIPTION: Renders a orange line between points (249, 188) and (351, 230).
; PLAN: r0=249(x1), r1=188(y1), r2=351(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 188
LDI r2, 351
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
