; DESCRIPTION: Places a orange line segment connecting (273, 187) to (35, 93).
; PLAN: r0=273(x1), r1=187(y1), r2=35(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 187
LDI r2, 35
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
