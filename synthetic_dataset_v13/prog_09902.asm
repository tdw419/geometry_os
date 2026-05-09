; DESCRIPTION: Renders a purple line between points (19, 68) and (414, 182).
; PLAN: r0=19(x1), r1=68(y1), r2=414(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 68
LDI r2, 414
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
