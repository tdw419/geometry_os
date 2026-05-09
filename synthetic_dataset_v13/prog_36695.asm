; DESCRIPTION: Renders a magenta line between points (190, 113) and (118, 51).
; PLAN: r0=190(x1), r1=113(y1), r2=118(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 113
LDI r2, 118
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
