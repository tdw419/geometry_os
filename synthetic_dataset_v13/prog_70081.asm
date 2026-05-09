; DESCRIPTION: Renders a purple line between points (42, 5) and (201, 247).
; PLAN: r0=42(x1), r1=5(y1), r2=201(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 5
LDI r2, 201
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
