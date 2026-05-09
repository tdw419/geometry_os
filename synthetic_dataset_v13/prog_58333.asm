; DESCRIPTION: Draws a black line from (302, 88) to (427, 52).
; PLAN: r0=302(x1), r1=88(y1), r2=427(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 88
LDI r2, 427
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
