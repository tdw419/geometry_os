; DESCRIPTION: Places a yellow line segment connecting (286, 156) to (245, 91).
; PLAN: r0=286(x1), r1=156(y1), r2=245(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 156
LDI r2, 245
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
