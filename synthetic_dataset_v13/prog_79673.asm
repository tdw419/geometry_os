; DESCRIPTION: Places a green line segment connecting (179, 156) to (177, 156).
; PLAN: r0=179(x1), r1=156(y1), r2=177(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 156
LDI r2, 177
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
