; DESCRIPTION: Places a orange line segment connecting (60, 110) to (411, 174).
; PLAN: r0=60(x1), r1=110(y1), r2=411(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 110
LDI r2, 411
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
