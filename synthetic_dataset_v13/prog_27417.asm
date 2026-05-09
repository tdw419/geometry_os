; DESCRIPTION: Renders a purple line between points (59, 109) and (154, 201).
; PLAN: r0=59(x1), r1=109(y1), r2=154(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 109
LDI r2, 154
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
