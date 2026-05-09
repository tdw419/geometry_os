; DESCRIPTION: Renders a magenta line between points (258, 201) and (102, 109).
; PLAN: r0=258(x1), r1=201(y1), r2=102(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 201
LDI r2, 102
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
