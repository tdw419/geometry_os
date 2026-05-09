; DESCRIPTION: Places a yellow line segment connecting (164, 183) to (91, 99).
; PLAN: r0=164(x1), r1=183(y1), r2=91(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 183
LDI r2, 91
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
