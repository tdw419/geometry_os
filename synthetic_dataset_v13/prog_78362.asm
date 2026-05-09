; DESCRIPTION: Renders a purple line between points (145, 142) and (422, 191).
; PLAN: r0=145(x1), r1=142(y1), r2=422(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 142
LDI r2, 422
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
