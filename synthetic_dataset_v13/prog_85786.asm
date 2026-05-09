; DESCRIPTION: Places a white line segment connecting (379, 230) to (422, 10).
; PLAN: r0=379(x1), r1=230(y1), r2=422(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 230
LDI r2, 422
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
