; DESCRIPTION: Places a yellow line segment connecting (416, 188) to (256, 238).
; PLAN: r0=416(x1), r1=188(y1), r2=256(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 188
LDI r2, 256
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
