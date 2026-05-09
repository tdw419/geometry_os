; DESCRIPTION: Places a blue line segment connecting (422, 45) to (95, 37).
; PLAN: r0=422(x1), r1=45(y1), r2=95(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 45
LDI r2, 95
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
