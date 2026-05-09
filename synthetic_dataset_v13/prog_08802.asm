; DESCRIPTION: Renders a magenta line between points (194, 142) and (50, 71).
; PLAN: r0=194(x1), r1=142(y1), r2=50(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 142
LDI r2, 50
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
