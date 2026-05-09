; DESCRIPTION: Places a orange line segment connecting (11, 93) to (188, 206).
; PLAN: r0=11(x1), r1=93(y1), r2=188(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 93
LDI r2, 188
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
