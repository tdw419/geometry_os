; DESCRIPTION: Places a blue line segment connecting (248, 55) to (302, 229).
; PLAN: r0=248(x1), r1=55(y1), r2=302(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 55
LDI r2, 302
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
