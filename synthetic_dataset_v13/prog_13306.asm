; DESCRIPTION: Renders a magenta line between points (389, 88) and (286, 2).
; PLAN: r0=389(x1), r1=88(y1), r2=286(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 88
LDI r2, 286
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
