; DESCRIPTION: Places a magenta line segment connecting (238, 165) to (99, 48).
; PLAN: r0=238(x1), r1=165(y1), r2=99(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 165
LDI r2, 99
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
