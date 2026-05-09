; DESCRIPTION: Places a white line segment connecting (254, 95) to (403, 201).
; PLAN: r0=254(x1), r1=95(y1), r2=403(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 95
LDI r2, 403
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
