; DESCRIPTION: Places a yellow line segment connecting (144, 23) to (310, 93).
; PLAN: r0=144(x1), r1=23(y1), r2=310(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 23
LDI r2, 310
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
