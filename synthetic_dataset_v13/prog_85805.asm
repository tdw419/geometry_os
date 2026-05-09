; DESCRIPTION: Renders a magenta line between points (468, 131) and (372, 191).
; PLAN: r0=468(x1), r1=131(y1), r2=372(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 131
LDI r2, 372
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
