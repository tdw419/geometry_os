; DESCRIPTION: Places a orange line segment connecting (444, 103) to (341, 69).
; PLAN: r0=444(x1), r1=103(y1), r2=341(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 103
LDI r2, 341
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
