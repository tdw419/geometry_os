; DESCRIPTION: Places a magenta line segment connecting (238, 176) to (227, 24).
; PLAN: r0=238(x1), r1=176(y1), r2=227(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 176
LDI r2, 227
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
