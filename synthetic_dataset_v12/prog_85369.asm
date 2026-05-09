; DESCRIPTION: Renders a blue line between points (220, 234) and (56, 85).
; PLAN: r0=220(x1), r1=234(y1), r2=56(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 234
LDI r2, 56
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
