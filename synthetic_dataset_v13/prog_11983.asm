; DESCRIPTION: Renders a magenta line between points (78, 100) and (199, 249).
; PLAN: r0=78(x1), r1=100(y1), r2=199(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 100
LDI r2, 199
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
