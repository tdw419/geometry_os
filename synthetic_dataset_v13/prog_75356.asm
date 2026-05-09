; DESCRIPTION: Places a orange line segment connecting (143, 102) to (373, 196).
; PLAN: r0=143(x1), r1=102(y1), r2=373(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 102
LDI r2, 373
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
