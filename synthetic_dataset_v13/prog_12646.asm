; DESCRIPTION: Places a orange line segment connecting (403, 157) to (170, 166).
; PLAN: r0=403(x1), r1=157(y1), r2=170(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 157
LDI r2, 170
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
