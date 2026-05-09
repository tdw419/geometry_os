; DESCRIPTION: Draws a black line from (498, 17) to (119, 9).
; PLAN: r0=498(x1), r1=17(y1), r2=119(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 17
LDI r2, 119
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
