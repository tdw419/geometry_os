; DESCRIPTION: Renders a purple line between points (452, 20) and (422, 195).
; PLAN: r0=452(x1), r1=20(y1), r2=422(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 20
LDI r2, 422
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
