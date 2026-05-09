; DESCRIPTION: Places a orange line segment connecting (500, 187) to (50, 168).
; PLAN: r0=500(x1), r1=187(y1), r2=50(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 187
LDI r2, 50
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
