; DESCRIPTION: Places a orange line segment connecting (119, 47) to (150, 18).
; PLAN: r0=119(x1), r1=47(y1), r2=150(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 47
LDI r2, 150
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
