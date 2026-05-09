; DESCRIPTION: Places a orange line segment connecting (302, 222) to (437, 36).
; PLAN: r0=302(x1), r1=222(y1), r2=437(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 222
LDI r2, 437
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
