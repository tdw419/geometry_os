; DESCRIPTION: Renders a magenta line between points (472, 21) and (45, 122).
; PLAN: r0=472(x1), r1=21(y1), r2=45(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 21
LDI r2, 45
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
