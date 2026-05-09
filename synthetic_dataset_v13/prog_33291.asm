; DESCRIPTION: Places a blue line segment connecting (486, 86) to (133, 32).
; PLAN: r0=486(x1), r1=86(y1), r2=133(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 86
LDI r2, 133
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
