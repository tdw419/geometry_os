; DESCRIPTION: Renders a magenta line between points (62, 53) and (300, 60).
; PLAN: r0=62(x1), r1=53(y1), r2=300(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 53
LDI r2, 300
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
