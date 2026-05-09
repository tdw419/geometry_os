; DESCRIPTION: Draws a purple line from (76, 91) to (472, 18).
; PLAN: r0=76(x1), r1=91(y1), r2=472(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 91
LDI r2, 472
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
