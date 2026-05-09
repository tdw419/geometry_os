; DESCRIPTION: Places a magenta line segment connecting (188, 142) to (238, 45).
; PLAN: r0=188(x1), r1=142(y1), r2=238(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 142
LDI r2, 238
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
