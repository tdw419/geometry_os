; DESCRIPTION: Draws a black line from (278, 119) to (378, 186).
; PLAN: r0=278(x1), r1=119(y1), r2=378(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 119
LDI r2, 378
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
