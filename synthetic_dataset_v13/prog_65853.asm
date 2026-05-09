; DESCRIPTION: Renders a purple line between points (82, 196) and (414, 243).
; PLAN: r0=82(x1), r1=196(y1), r2=414(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 196
LDI r2, 414
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
