; DESCRIPTION: Places a purple line segment connecting (168, 29) to (463, 109).
; PLAN: r0=168(x1), r1=29(y1), r2=463(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 29
LDI r2, 463
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
