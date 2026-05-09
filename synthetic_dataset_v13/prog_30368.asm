; DESCRIPTION: Renders a magenta line between points (71, 167) and (0, 51).
; PLAN: r0=71(x1), r1=167(y1), r2=0(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 167
LDI r2, 0
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
