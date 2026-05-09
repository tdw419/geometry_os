; DESCRIPTION: Places a blue line segment connecting (447, 171) to (231, 128).
; PLAN: r0=447(x1), r1=171(y1), r2=231(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 171
LDI r2, 231
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
