; DESCRIPTION: Renders a magenta line between points (158, 195) and (148, 28).
; PLAN: r0=158(x1), r1=195(y1), r2=148(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 195
LDI r2, 148
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
