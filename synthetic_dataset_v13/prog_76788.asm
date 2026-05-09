; DESCRIPTION: Places a yellow line segment connecting (303, 156) to (91, 156).
; PLAN: r0=303(x1), r1=156(y1), r2=91(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 156
LDI r2, 91
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
