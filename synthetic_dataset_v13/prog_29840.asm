; DESCRIPTION: Places a white line segment connecting (252, 254) to (421, 56).
; PLAN: r0=252(x1), r1=254(y1), r2=421(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 254
LDI r2, 421
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
