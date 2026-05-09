; DESCRIPTION: Places a orange line segment connecting (153, 81) to (432, 174).
; PLAN: r0=153(x1), r1=81(y1), r2=432(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 81
LDI r2, 432
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
