; DESCRIPTION: Places a orange line segment connecting (358, 102) to (118, 29).
; PLAN: r0=358(x1), r1=102(y1), r2=118(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 102
LDI r2, 118
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
