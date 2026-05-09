; DESCRIPTION: Places a orange line segment connecting (268, 33) to (115, 156).
; PLAN: r0=268(x1), r1=33(y1), r2=115(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 33
LDI r2, 115
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
