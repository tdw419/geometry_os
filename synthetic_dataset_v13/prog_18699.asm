; DESCRIPTION: Places a orange line segment connecting (110, 12) to (271, 46).
; PLAN: r0=110(x1), r1=12(y1), r2=271(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 12
LDI r2, 271
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
