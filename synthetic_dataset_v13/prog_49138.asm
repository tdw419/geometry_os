; DESCRIPTION: Places a yellow line segment connecting (302, 29) to (367, 30).
; PLAN: r0=302(x1), r1=29(y1), r2=367(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 29
LDI r2, 367
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
