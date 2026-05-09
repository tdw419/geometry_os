; DESCRIPTION: Places a orange line segment connecting (414, 46) to (187, 75).
; PLAN: r0=414(x1), r1=46(y1), r2=187(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 46
LDI r2, 187
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
