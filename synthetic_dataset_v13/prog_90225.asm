; DESCRIPTION: Draws a black line from (351, 217) to (137, 233).
; PLAN: r0=351(x1), r1=217(y1), r2=137(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 217
LDI r2, 137
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
