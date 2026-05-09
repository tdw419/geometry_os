; DESCRIPTION: Places a blue line segment connecting (422, 131) to (467, 27).
; PLAN: r0=422(x1), r1=131(y1), r2=467(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 131
LDI r2, 467
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
