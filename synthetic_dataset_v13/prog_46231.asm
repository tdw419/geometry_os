; DESCRIPTION: Renders a purple line between points (12, 112) and (397, 249).
; PLAN: r0=12(x1), r1=112(y1), r2=397(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 112
LDI r2, 397
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
