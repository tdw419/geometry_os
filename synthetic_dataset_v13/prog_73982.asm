; DESCRIPTION: Places a black line segment connecting (302, 216) to (76, 28).
; PLAN: r0=302(x1), r1=216(y1), r2=76(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 216
LDI r2, 76
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
