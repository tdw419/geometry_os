; DESCRIPTION: Places a blue line segment connecting (148, 20) to (425, 101).
; PLAN: r0=148(x1), r1=20(y1), r2=425(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 20
LDI r2, 425
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
