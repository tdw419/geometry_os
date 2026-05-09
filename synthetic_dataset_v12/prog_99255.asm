; DESCRIPTION: Renders a purple line between points (373, 193) and (293, 20).
; PLAN: r0=373(x1), r1=193(y1), r2=293(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 193
LDI r2, 293
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
