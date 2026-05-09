; DESCRIPTION: Renders a purple line between points (380, 154) and (501, 201).
; PLAN: r0=380(x1), r1=154(y1), r2=501(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 154
LDI r2, 501
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
