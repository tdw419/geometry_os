; DESCRIPTION: Renders a magenta line between points (119, 155) and (63, 214).
; PLAN: r0=119(x1), r1=155(y1), r2=63(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 155
LDI r2, 63
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
