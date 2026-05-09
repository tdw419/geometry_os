; DESCRIPTION: Places a magenta line segment connecting (317, 165) to (53, 49).
; PLAN: r0=317(x1), r1=165(y1), r2=53(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 165
LDI r2, 53
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
