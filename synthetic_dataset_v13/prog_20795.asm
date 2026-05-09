; DESCRIPTION: Places a orange line segment connecting (413, 225) to (461, 210).
; PLAN: r0=413(x1), r1=225(y1), r2=461(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 225
LDI r2, 461
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
