; DESCRIPTION: Places a blue line segment connecting (117, 69) to (422, 232).
; PLAN: r0=117(x1), r1=69(y1), r2=422(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 69
LDI r2, 422
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
