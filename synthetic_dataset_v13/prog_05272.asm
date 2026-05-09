; DESCRIPTION: Renders a magenta line between points (78, 138) and (5, 189).
; PLAN: r0=78(x1), r1=138(y1), r2=5(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 138
LDI r2, 5
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
