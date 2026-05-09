; DESCRIPTION: Places a blue line segment connecting (94, 62) to (72, 187).
; PLAN: r0=94(x1), r1=62(y1), r2=72(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 62
LDI r2, 72
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
