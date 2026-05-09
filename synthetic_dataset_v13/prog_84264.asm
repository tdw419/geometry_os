; DESCRIPTION: Places a white line segment connecting (43, 201) to (85, 239).
; PLAN: r0=43(x1), r1=201(y1), r2=85(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 201
LDI r2, 85
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
