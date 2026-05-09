; DESCRIPTION: Places a magenta line segment connecting (135, 230) to (274, 250).
; PLAN: r0=135(x1), r1=230(y1), r2=274(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 230
LDI r2, 274
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
