; DESCRIPTION: Renders a magenta line between points (69, 250) and (200, 74).
; PLAN: r0=69(x1), r1=250(y1), r2=200(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 250
LDI r2, 200
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
