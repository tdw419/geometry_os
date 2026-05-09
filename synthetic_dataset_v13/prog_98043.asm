; DESCRIPTION: Places a yellow line segment connecting (480, 5) to (231, 157).
; PLAN: r0=480(x1), r1=5(y1), r2=231(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 5
LDI r2, 231
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
