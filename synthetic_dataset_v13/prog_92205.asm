; DESCRIPTION: Places a yellow line segment connecting (96, 231) to (420, 157).
; PLAN: r0=96(x1), r1=231(y1), r2=420(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 231
LDI r2, 420
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
