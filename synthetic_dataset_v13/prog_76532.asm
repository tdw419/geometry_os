; DESCRIPTION: Places a yellow line segment connecting (32, 73) to (484, 230).
; PLAN: r0=32(x1), r1=73(y1), r2=484(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 73
LDI r2, 484
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
