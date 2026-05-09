; DESCRIPTION: Places a blue line segment connecting (346, 76) to (148, 60).
; PLAN: r0=346(x1), r1=76(y1), r2=148(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 76
LDI r2, 148
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
