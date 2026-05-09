; DESCRIPTION: Renders a purple line between points (56, 254) and (345, 167).
; PLAN: r0=56(x1), r1=254(y1), r2=345(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 254
LDI r2, 345
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
