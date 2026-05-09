; DESCRIPTION: Places a orange line segment connecting (269, 13) to (423, 98).
; PLAN: r0=269(x1), r1=13(y1), r2=423(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 13
LDI r2, 423
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
