; DESCRIPTION: Places a green line segment connecting (26, 101) to (144, 65).
; PLAN: r0=26(x1), r1=101(y1), r2=144(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 101
LDI r2, 144
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
