; DESCRIPTION: Renders a magenta line between points (6, 17) and (234, 155).
; PLAN: r0=6(x1), r1=17(y1), r2=234(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 17
LDI r2, 234
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
