; DESCRIPTION: Places a orange line segment connecting (31, 255) to (37, 152).
; PLAN: r0=31(x1), r1=255(y1), r2=37(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 255
LDI r2, 37
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
