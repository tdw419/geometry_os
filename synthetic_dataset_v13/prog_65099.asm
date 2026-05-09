; DESCRIPTION: Places a blue line segment connecting (491, 168) to (376, 30).
; PLAN: r0=491(x1), r1=168(y1), r2=376(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 168
LDI r2, 376
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
