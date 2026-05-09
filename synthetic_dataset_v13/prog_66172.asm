; DESCRIPTION: Renders a magenta line between points (411, 109) and (122, 23).
; PLAN: r0=411(x1), r1=109(y1), r2=122(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 109
LDI r2, 122
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
