; DESCRIPTION: Renders a purple line between points (421, 105) and (406, 48).
; PLAN: r0=421(x1), r1=105(y1), r2=406(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 105
LDI r2, 406
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
