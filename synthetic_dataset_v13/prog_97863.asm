; DESCRIPTION: Places a yellow line segment connecting (129, 106) to (75, 159).
; PLAN: r0=129(x1), r1=106(y1), r2=75(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 106
LDI r2, 75
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
