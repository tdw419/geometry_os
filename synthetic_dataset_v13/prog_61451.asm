; DESCRIPTION: Renders a purple line between points (304, 157) and (268, 2).
; PLAN: r0=304(x1), r1=157(y1), r2=268(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 157
LDI r2, 268
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
