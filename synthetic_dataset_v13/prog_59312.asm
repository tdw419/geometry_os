; DESCRIPTION: Places a orange line segment connecting (191, 93) to (91, 163).
; PLAN: r0=191(x1), r1=93(y1), r2=91(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 93
LDI r2, 91
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
