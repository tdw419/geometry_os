; DESCRIPTION: Places a orange line segment connecting (288, 246) to (247, 69).
; PLAN: r0=288(x1), r1=246(y1), r2=247(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 246
LDI r2, 247
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
