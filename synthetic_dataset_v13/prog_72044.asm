; DESCRIPTION: Draws a black line from (380, 34) to (505, 147).
; PLAN: r0=380(x1), r1=34(y1), r2=505(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 34
LDI r2, 505
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
