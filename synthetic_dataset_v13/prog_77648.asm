; DESCRIPTION: Renders a magenta line between points (377, 138) and (30, 100).
; PLAN: r0=377(x1), r1=138(y1), r2=30(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 138
LDI r2, 30
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
