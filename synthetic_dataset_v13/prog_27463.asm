; DESCRIPTION: Draws a black line from (351, 16) to (227, 191).
; PLAN: r0=351(x1), r1=16(y1), r2=227(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 16
LDI r2, 227
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
