; DESCRIPTION: Places a green line segment connecting (427, 156) to (42, 58).
; PLAN: r0=427(x1), r1=156(y1), r2=42(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 156
LDI r2, 42
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
