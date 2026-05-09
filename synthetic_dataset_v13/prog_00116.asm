; DESCRIPTION: Places a white line segment connecting (199, 162) to (422, 120).
; PLAN: r0=199(x1), r1=162(y1), r2=422(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 162
LDI r2, 422
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
