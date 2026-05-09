; DESCRIPTION: Places a orange line segment connecting (112, 244) to (69, 115).
; PLAN: r0=112(x1), r1=244(y1), r2=69(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 244
LDI r2, 69
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
