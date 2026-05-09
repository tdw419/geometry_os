; DESCRIPTION: Renders a magenta line between points (60, 155) and (113, 184).
; PLAN: r0=60(x1), r1=155(y1), r2=113(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 155
LDI r2, 113
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
