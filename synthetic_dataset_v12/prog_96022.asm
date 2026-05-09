; DESCRIPTION: Places a blue line segment connecting (376, 108) to (21, 134).
; PLAN: r0=376(x1), r1=108(y1), r2=21(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 108
LDI r2, 21
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
