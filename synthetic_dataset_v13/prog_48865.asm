; DESCRIPTION: Places a orange line segment connecting (468, 134) to (225, 57).
; PLAN: r0=468(x1), r1=134(y1), r2=225(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 134
LDI r2, 225
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
