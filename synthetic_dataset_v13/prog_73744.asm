; DESCRIPTION: Places a magenta line segment connecting (421, 102) to (69, 77).
; PLAN: r0=421(x1), r1=102(y1), r2=69(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 102
LDI r2, 69
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
