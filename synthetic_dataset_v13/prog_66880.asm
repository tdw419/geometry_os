; DESCRIPTION: Places a blue line segment connecting (154, 183) to (58, 61).
; PLAN: r0=154(x1), r1=183(y1), r2=58(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 183
LDI r2, 58
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
