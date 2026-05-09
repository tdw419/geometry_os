; DESCRIPTION: Renders a blue line between points (368, 120) and (422, 158).
; PLAN: r0=368(x1), r1=120(y1), r2=422(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 120
LDI r2, 422
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
