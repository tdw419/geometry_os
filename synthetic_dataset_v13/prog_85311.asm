; DESCRIPTION: Places a orange line segment connecting (98, 188) to (366, 93).
; PLAN: r0=98(x1), r1=188(y1), r2=366(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 188
LDI r2, 366
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
