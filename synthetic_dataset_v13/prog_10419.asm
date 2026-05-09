; DESCRIPTION: Renders a purple line between points (8, 201) and (168, 228).
; PLAN: r0=8(x1), r1=201(y1), r2=168(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 201
LDI r2, 168
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
