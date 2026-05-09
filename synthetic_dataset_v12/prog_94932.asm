; DESCRIPTION: Draws a black line from (260, 97) to (15, 129).
; PLAN: r0=260(x1), r1=97(y1), r2=15(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 97
LDI r2, 15
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
