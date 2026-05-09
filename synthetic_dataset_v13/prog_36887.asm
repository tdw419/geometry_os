; DESCRIPTION: Renders a purple line between points (481, 254) and (472, 6).
; PLAN: r0=481(x1), r1=254(y1), r2=472(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 254
LDI r2, 472
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
