; DESCRIPTION: Places a black line segment connecting (475, 231) to (200, 85).
; PLAN: r0=475(x1), r1=231(y1), r2=200(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 231
LDI r2, 200
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
