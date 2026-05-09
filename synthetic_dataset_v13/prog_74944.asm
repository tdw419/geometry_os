; DESCRIPTION: Renders a magenta line between points (132, 51) and (50, 204).
; PLAN: r0=132(x1), r1=51(y1), r2=50(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 51
LDI r2, 50
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
