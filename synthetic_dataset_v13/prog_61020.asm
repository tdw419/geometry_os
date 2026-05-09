; DESCRIPTION: Places a yellow line segment connecting (337, 10) to (319, 156).
; PLAN: r0=337(x1), r1=10(y1), r2=319(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 10
LDI r2, 319
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
