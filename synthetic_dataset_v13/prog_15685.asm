; DESCRIPTION: Places a white line segment connecting (200, 184) to (3, 239).
; PLAN: r0=200(x1), r1=184(y1), r2=3(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 184
LDI r2, 3
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
