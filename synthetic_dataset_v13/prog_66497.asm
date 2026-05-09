; DESCRIPTION: Renders a purple line between points (399, 192) and (254, 24).
; PLAN: r0=399(x1), r1=192(y1), r2=254(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 192
LDI r2, 254
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
