; DESCRIPTION: Renders a purple line between points (414, 63) and (366, 60).
; PLAN: r0=414(x1), r1=63(y1), r2=366(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 63
LDI r2, 366
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
