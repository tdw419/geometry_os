; DESCRIPTION: Places a magenta line segment connecting (274, 159) to (135, 155).
; PLAN: r0=274(x1), r1=159(y1), r2=135(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 159
LDI r2, 135
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
