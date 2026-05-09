; DESCRIPTION: Places a orange line segment connecting (184, 14) to (140, 209).
; PLAN: r0=184(x1), r1=14(y1), r2=140(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 14
LDI r2, 140
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
