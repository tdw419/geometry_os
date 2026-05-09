; DESCRIPTION: Places a magenta line segment connecting (232, 167) to (149, 29).
; PLAN: r0=232(x1), r1=167(y1), r2=149(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 167
LDI r2, 149
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
