; DESCRIPTION: Renders a purple line between points (0, 122) and (421, 129).
; PLAN: r0=0(x1), r1=122(y1), r2=421(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 122
LDI r2, 421
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
