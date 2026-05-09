; DESCRIPTION: Places a orange line segment connecting (91, 156) to (495, 171).
; PLAN: r0=91(x1), r1=156(y1), r2=495(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 156
LDI r2, 495
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
