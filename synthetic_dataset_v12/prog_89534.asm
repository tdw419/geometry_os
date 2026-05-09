; DESCRIPTION: Places a orange line segment connecting (31, 93) to (120, 135).
; PLAN: r0=31(x1), r1=93(y1), r2=120(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 93
LDI r2, 120
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
