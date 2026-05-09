; DESCRIPTION: Places a orange line segment connecting (368, 83) to (120, 141).
; PLAN: r0=368(x1), r1=83(y1), r2=120(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 83
LDI r2, 120
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
