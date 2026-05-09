; DESCRIPTION: Places a orange line segment connecting (500, 208) to (292, 86).
; PLAN: r0=500(x1), r1=208(y1), r2=292(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 208
LDI r2, 292
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
