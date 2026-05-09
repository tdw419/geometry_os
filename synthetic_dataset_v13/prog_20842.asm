; DESCRIPTION: Places a yellow line segment connecting (359, 167) to (196, 106).
; PLAN: r0=359(x1), r1=167(y1), r2=196(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 167
LDI r2, 196
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
