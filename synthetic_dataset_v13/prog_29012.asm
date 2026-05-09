; DESCRIPTION: Places a orange line segment connecting (69, 77) to (152, 49).
; PLAN: r0=69(x1), r1=77(y1), r2=152(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 77
LDI r2, 152
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
