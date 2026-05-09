; DESCRIPTION: Renders a magenta line between points (350, 20) and (62, 222).
; PLAN: r0=350(x1), r1=20(y1), r2=62(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 20
LDI r2, 62
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
