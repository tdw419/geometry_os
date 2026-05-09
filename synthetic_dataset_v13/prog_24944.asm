; DESCRIPTION: Places a orange line segment connecting (338, 40) to (168, 239).
; PLAN: r0=338(x1), r1=40(y1), r2=168(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 40
LDI r2, 168
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
