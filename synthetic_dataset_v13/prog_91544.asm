; DESCRIPTION: Renders a magenta line between points (420, 88) and (238, 66).
; PLAN: r0=420(x1), r1=88(y1), r2=238(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 88
LDI r2, 238
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
