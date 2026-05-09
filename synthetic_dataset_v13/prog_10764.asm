; DESCRIPTION: Renders a magenta line between points (484, 69) and (209, 106).
; PLAN: r0=484(x1), r1=69(y1), r2=209(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 69
LDI r2, 209
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
