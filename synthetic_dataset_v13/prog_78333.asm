; DESCRIPTION: Renders a magenta line between points (100, 153) and (407, 45).
; PLAN: r0=100(x1), r1=153(y1), r2=407(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 153
LDI r2, 407
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
