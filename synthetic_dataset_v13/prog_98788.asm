; DESCRIPTION: Places a orange line segment connecting (3, 41) to (470, 193).
; PLAN: r0=3(x1), r1=41(y1), r2=470(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 41
LDI r2, 470
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
