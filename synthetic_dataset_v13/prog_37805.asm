; DESCRIPTION: Draws a black line from (457, 207) to (177, 147).
; PLAN: r0=457(x1), r1=207(y1), r2=177(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 207
LDI r2, 177
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
