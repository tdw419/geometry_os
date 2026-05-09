; DESCRIPTION: Renders a purple line between points (254, 101) and (385, 166).
; PLAN: r0=254(x1), r1=101(y1), r2=385(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 101
LDI r2, 385
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
