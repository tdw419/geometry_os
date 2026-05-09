; DESCRIPTION: Places a green line segment connecting (383, 179) to (227, 94).
; PLAN: r0=383(x1), r1=179(y1), r2=227(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 179
LDI r2, 227
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
