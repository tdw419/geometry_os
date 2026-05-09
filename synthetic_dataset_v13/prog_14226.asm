; DESCRIPTION: Renders a magenta line between points (330, 123) and (134, 254).
; PLAN: r0=330(x1), r1=123(y1), r2=134(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 123
LDI r2, 134
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
