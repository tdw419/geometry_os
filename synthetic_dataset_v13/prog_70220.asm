; DESCRIPTION: Places a blue line segment connecting (311, 185) to (165, 16).
; PLAN: r0=311(x1), r1=185(y1), r2=165(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 185
LDI r2, 165
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
