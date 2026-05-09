; DESCRIPTION: Renders a blue line between points (107, 43) and (422, 33).
; PLAN: r0=107(x1), r1=43(y1), r2=422(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 43
LDI r2, 422
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
