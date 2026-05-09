; DESCRIPTION: Places a yellow line segment connecting (32, 111) to (359, 118).
; PLAN: r0=32(x1), r1=111(y1), r2=359(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 111
LDI r2, 359
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
