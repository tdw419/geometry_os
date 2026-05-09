; DESCRIPTION: Places a orange line segment connecting (416, 3) to (398, 147).
; PLAN: r0=416(x1), r1=3(y1), r2=398(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 3
LDI r2, 398
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
