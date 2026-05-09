; DESCRIPTION: Renders a magenta line between points (40, 142) and (204, 2).
; PLAN: r0=40(x1), r1=142(y1), r2=204(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 142
LDI r2, 204
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
