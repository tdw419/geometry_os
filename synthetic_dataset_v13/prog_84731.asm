; DESCRIPTION: Places a green line segment connecting (130, 209) to (472, 245).
; PLAN: r0=130(x1), r1=209(y1), r2=472(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 209
LDI r2, 472
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
