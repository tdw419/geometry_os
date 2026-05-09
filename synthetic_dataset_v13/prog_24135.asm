; DESCRIPTION: Places a orange line segment connecting (91, 100) to (401, 107).
; PLAN: r0=91(x1), r1=100(y1), r2=401(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 100
LDI r2, 401
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
