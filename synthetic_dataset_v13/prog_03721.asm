; DESCRIPTION: Renders a magenta line between points (396, 188) and (25, 158).
; PLAN: r0=396(x1), r1=188(y1), r2=25(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 188
LDI r2, 25
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
