; DESCRIPTION: Renders a purple line between points (422, 86) and (213, 182).
; PLAN: r0=422(x1), r1=86(y1), r2=213(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 86
LDI r2, 213
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
