; DESCRIPTION: Renders a magenta line between points (412, 109) and (201, 19).
; PLAN: r0=412(x1), r1=109(y1), r2=201(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 109
LDI r2, 201
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
