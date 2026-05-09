; DESCRIPTION: Places a yellow line segment connecting (387, 179) to (192, 96).
; PLAN: r0=387(x1), r1=179(y1), r2=192(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 179
LDI r2, 192
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
