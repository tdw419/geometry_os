; DESCRIPTION: Places a yellow line segment connecting (422, 60) to (507, 131).
; PLAN: r0=422(x1), r1=60(y1), r2=507(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 60
LDI r2, 507
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
