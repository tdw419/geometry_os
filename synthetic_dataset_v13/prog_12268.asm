; DESCRIPTION: Renders a magenta line between points (166, 136) and (292, 168).
; PLAN: r0=166(x1), r1=136(y1), r2=292(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 136
LDI r2, 292
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
