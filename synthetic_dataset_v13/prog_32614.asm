; DESCRIPTION: Renders a magenta line between points (29, 33) and (81, 148).
; PLAN: r0=29(x1), r1=33(y1), r2=81(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 33
LDI r2, 81
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
