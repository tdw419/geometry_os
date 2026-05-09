; DESCRIPTION: Places a white line segment connecting (347, 72) to (184, 191).
; PLAN: r0=347(x1), r1=72(y1), r2=184(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 72
LDI r2, 184
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
