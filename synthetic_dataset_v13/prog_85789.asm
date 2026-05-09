; DESCRIPTION: Renders a purple line between points (58, 17) and (422, 225).
; PLAN: r0=58(x1), r1=17(y1), r2=422(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 17
LDI r2, 422
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
