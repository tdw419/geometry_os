; DESCRIPTION: Renders a magenta line between points (394, 131) and (389, 201).
; PLAN: r0=394(x1), r1=131(y1), r2=389(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 131
LDI r2, 389
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
