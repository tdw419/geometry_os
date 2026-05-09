; DESCRIPTION: Places a blue line segment connecting (131, 20) to (403, 249).
; PLAN: r0=131(x1), r1=20(y1), r2=403(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 20
LDI r2, 403
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
