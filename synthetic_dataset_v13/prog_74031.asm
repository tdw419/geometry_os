; DESCRIPTION: Places a orange line segment connecting (292, 138) to (145, 120).
; PLAN: r0=292(x1), r1=138(y1), r2=145(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 138
LDI r2, 145
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
