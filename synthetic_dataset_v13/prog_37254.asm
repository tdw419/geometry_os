; DESCRIPTION: Places a orange line segment connecting (191, 247) to (234, 151).
; PLAN: r0=191(x1), r1=247(y1), r2=234(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 247
LDI r2, 234
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
