; DESCRIPTION: Renders a magenta line between points (130, 201) and (52, 157).
; PLAN: r0=130(x1), r1=201(y1), r2=52(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 201
LDI r2, 52
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
