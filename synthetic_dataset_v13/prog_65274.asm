; DESCRIPTION: Places a cyan line segment connecting (422, 54) to (402, 194).
; PLAN: r0=422(x1), r1=54(y1), r2=402(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 54
LDI r2, 402
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
