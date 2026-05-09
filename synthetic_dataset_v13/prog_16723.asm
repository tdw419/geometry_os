; DESCRIPTION: Places a orange line segment connecting (494, 171) to (57, 148).
; PLAN: r0=494(x1), r1=171(y1), r2=57(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 171
LDI r2, 57
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
