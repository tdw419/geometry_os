; DESCRIPTION: Places a orange line segment connecting (187, 8) to (182, 252).
; PLAN: r0=187(x1), r1=8(y1), r2=182(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 8
LDI r2, 182
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
