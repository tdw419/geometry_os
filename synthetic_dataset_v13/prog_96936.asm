; DESCRIPTION: Places a black line segment connecting (18, 57) to (302, 54).
; PLAN: r0=18(x1), r1=57(y1), r2=302(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 57
LDI r2, 302
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
