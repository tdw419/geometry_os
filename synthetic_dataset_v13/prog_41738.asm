; DESCRIPTION: Places a black line segment connecting (302, 79) to (43, 183).
; PLAN: r0=302(x1), r1=79(y1), r2=43(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 79
LDI r2, 43
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
