; DESCRIPTION: Places a green line segment connecting (130, 144) to (490, 15).
; PLAN: r0=130(x1), r1=144(y1), r2=490(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 144
LDI r2, 490
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
