; DESCRIPTION: Places a orange line segment connecting (67, 178) to (10, 171).
; PLAN: r0=67(x1), r1=178(y1), r2=10(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 178
LDI r2, 10
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
