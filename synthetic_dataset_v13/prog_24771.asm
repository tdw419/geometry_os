; DESCRIPTION: Renders a purple line between points (274, 208) and (422, 125).
; PLAN: r0=274(x1), r1=208(y1), r2=422(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 208
LDI r2, 422
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
