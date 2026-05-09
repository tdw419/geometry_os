; DESCRIPTION: Draws a black line from (345, 110) to (414, 62).
; PLAN: r0=345(x1), r1=110(y1), r2=414(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 110
LDI r2, 414
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
