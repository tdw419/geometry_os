; DESCRIPTION: Renders a purple line between points (35, 189) and (421, 233).
; PLAN: r0=35(x1), r1=189(y1), r2=421(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 189
LDI r2, 421
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
