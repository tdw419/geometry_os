; DESCRIPTION: Renders a magenta line between points (189, 166) and (136, 7).
; PLAN: r0=189(x1), r1=166(y1), r2=136(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 166
LDI r2, 136
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
