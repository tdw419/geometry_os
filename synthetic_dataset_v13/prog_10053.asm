; DESCRIPTION: Places a magenta line segment connecting (300, 12) to (282, 217).
; PLAN: r0=300(x1), r1=12(y1), r2=282(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 12
LDI r2, 282
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
