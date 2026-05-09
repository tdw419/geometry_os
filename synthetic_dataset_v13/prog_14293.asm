; DESCRIPTION: Renders a magenta line between points (60, 11) and (51, 168).
; PLAN: r0=60(x1), r1=11(y1), r2=51(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 11
LDI r2, 51
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
