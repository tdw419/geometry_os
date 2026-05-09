; DESCRIPTION: Places a yellow line segment connecting (242, 156) to (25, 199).
; PLAN: r0=242(x1), r1=156(y1), r2=25(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 156
LDI r2, 25
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
