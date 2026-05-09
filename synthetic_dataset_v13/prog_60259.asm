; DESCRIPTION: Places a green line segment connecting (74, 86) to (158, 254).
; PLAN: r0=74(x1), r1=86(y1), r2=158(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 86
LDI r2, 158
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
