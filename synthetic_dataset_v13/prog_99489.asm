; DESCRIPTION: Places a yellow line segment connecting (150, 62) to (345, 136).
; PLAN: r0=150(x1), r1=62(y1), r2=345(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 62
LDI r2, 345
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
