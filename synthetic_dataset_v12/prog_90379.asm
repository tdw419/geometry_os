; DESCRIPTION: Renders a magenta line between points (156, 155) and (76, 220).
; PLAN: r0=156(x1), r1=155(y1), r2=76(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 155
LDI r2, 76
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
