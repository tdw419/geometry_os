; DESCRIPTION: Places a orange line segment connecting (401, 90) to (21, 203).
; PLAN: r0=401(x1), r1=90(y1), r2=21(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 90
LDI r2, 21
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
