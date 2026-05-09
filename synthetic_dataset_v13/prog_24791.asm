; DESCRIPTION: Places a orange line segment connecting (170, 112) to (149, 29).
; PLAN: r0=170(x1), r1=112(y1), r2=149(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 112
LDI r2, 149
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
