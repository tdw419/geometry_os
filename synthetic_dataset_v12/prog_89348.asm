; DESCRIPTION: Renders a purple line between points (234, 154) and (422, 141).
; PLAN: r0=234(x1), r1=154(y1), r2=422(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 154
LDI r2, 422
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
