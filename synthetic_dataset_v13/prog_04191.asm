; DESCRIPTION: Renders a purple line between points (304, 26) and (194, 152).
; PLAN: r0=304(x1), r1=26(y1), r2=194(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 26
LDI r2, 194
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
