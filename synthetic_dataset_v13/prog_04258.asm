; DESCRIPTION: Renders a magenta line between points (112, 51) and (294, 81).
; PLAN: r0=112(x1), r1=51(y1), r2=294(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 51
LDI r2, 294
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
