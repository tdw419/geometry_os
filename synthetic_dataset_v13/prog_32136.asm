; DESCRIPTION: Places a blue line segment connecting (477, 154) to (422, 141).
; PLAN: r0=477(x1), r1=154(y1), r2=422(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 154
LDI r2, 422
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
