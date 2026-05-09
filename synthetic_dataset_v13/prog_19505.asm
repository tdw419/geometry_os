; DESCRIPTION: Places a green line segment connecting (156, 169) to (373, 8).
; PLAN: r0=156(x1), r1=169(y1), r2=373(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 169
LDI r2, 373
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
