; DESCRIPTION: Places a blue line segment connecting (32, 140) to (489, 202).
; PLAN: r0=32(x1), r1=140(y1), r2=489(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 140
LDI r2, 489
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
