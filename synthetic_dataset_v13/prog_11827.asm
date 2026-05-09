; DESCRIPTION: Renders a magenta line between points (199, 101) and (19, 230).
; PLAN: r0=199(x1), r1=101(y1), r2=19(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 101
LDI r2, 19
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
