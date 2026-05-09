; DESCRIPTION: Places a orange line segment connecting (271, 178) to (167, 14).
; PLAN: r0=271(x1), r1=178(y1), r2=167(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 178
LDI r2, 167
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
