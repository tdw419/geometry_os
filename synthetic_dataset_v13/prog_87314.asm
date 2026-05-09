; DESCRIPTION: Renders a magenta line between points (374, 14) and (201, 0).
; PLAN: r0=374(x1), r1=14(y1), r2=201(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 14
LDI r2, 201
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
