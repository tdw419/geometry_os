; DESCRIPTION: Places a yellow line segment connecting (307, 97) to (85, 144).
; PLAN: r0=307(x1), r1=97(y1), r2=85(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 97
LDI r2, 85
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
