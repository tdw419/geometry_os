; DESCRIPTION: Places a orange line segment connecting (393, 77) to (69, 135).
; PLAN: r0=393(x1), r1=77(y1), r2=69(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 77
LDI r2, 69
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
