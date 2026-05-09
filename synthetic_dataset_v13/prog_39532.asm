; DESCRIPTION: Places a green line segment connecting (58, 4) to (156, 140).
; PLAN: r0=58(x1), r1=4(y1), r2=156(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 4
LDI r2, 156
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
