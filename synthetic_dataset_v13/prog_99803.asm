; DESCRIPTION: Places a orange line segment connecting (129, 45) to (366, 182).
; PLAN: r0=129(x1), r1=45(y1), r2=366(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 45
LDI r2, 366
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
