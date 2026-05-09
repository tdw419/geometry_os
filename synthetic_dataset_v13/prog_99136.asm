; DESCRIPTION: Places a white line segment connecting (64, 123) to (422, 143).
; PLAN: r0=64(x1), r1=123(y1), r2=422(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 123
LDI r2, 422
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
