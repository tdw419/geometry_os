; DESCRIPTION: Places a orange line segment connecting (119, 233) to (127, 159).
; PLAN: r0=119(x1), r1=233(y1), r2=127(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 233
LDI r2, 127
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
