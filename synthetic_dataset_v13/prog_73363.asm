; DESCRIPTION: Places a yellow line segment connecting (389, 14) to (128, 83).
; PLAN: r0=389(x1), r1=14(y1), r2=128(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 14
LDI r2, 128
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
