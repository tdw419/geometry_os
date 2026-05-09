; DESCRIPTION: Places a yellow line segment connecting (128, 58) to (231, 4).
; PLAN: r0=128(x1), r1=58(y1), r2=231(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 58
LDI r2, 231
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
