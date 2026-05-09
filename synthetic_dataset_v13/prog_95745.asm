; DESCRIPTION: Places a blue line segment connecting (163, 239) to (377, 172).
; PLAN: r0=163(x1), r1=239(y1), r2=377(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 239
LDI r2, 377
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
