; DESCRIPTION: Places a green line segment connecting (61, 94) to (484, 90).
; PLAN: r0=61(x1), r1=94(y1), r2=484(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 94
LDI r2, 484
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
