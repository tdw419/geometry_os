; DESCRIPTION: Renders a purple line between points (331, 150) and (422, 138).
; PLAN: r0=331(x1), r1=150(y1), r2=422(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 150
LDI r2, 422
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
