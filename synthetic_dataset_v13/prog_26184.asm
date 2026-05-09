; DESCRIPTION: Places a orange line segment connecting (216, 111) to (144, 251).
; PLAN: r0=216(x1), r1=111(y1), r2=144(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 111
LDI r2, 144
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
