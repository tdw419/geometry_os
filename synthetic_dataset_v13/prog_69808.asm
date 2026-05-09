; DESCRIPTION: Renders a magenta line between points (505, 232) and (474, 118).
; PLAN: r0=505(x1), r1=232(y1), r2=474(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 232
LDI r2, 474
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
