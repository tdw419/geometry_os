; DESCRIPTION: Places a magenta line segment connecting (93, 129) to (461, 148).
; PLAN: r0=93(x1), r1=129(y1), r2=461(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 129
LDI r2, 461
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
