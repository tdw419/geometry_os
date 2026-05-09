; DESCRIPTION: Places a purple line segment connecting (355, 165) to (262, 102).
; PLAN: r0=355(x1), r1=165(y1), r2=262(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 165
LDI r2, 262
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
