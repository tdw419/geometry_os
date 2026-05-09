; DESCRIPTION: Draws a black line from (427, 49) to (24, 85).
; PLAN: r0=427(x1), r1=49(y1), r2=24(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 49
LDI r2, 24
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
