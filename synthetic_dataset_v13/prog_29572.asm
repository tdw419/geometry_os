; DESCRIPTION: Places a orange line segment connecting (28, 171) to (167, 61).
; PLAN: r0=28(x1), r1=171(y1), r2=167(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 171
LDI r2, 167
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
