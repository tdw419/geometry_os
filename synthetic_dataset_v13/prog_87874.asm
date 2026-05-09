; DESCRIPTION: Renders a blue line between points (299, 23) and (422, 208).
; PLAN: r0=299(x1), r1=23(y1), r2=422(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 23
LDI r2, 422
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
