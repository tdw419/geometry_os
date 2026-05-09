; DESCRIPTION: Places a black line segment connecting (184, 62) to (422, 176).
; PLAN: r0=184(x1), r1=62(y1), r2=422(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 62
LDI r2, 422
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
