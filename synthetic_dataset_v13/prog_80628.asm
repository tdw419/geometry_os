; DESCRIPTION: Renders a purple line between points (421, 203) and (470, 148).
; PLAN: r0=421(x1), r1=203(y1), r2=470(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 203
LDI r2, 470
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
