; DESCRIPTION: Places a orange line segment connecting (401, 64) to (40, 26).
; PLAN: r0=401(x1), r1=64(y1), r2=40(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 64
LDI r2, 40
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
