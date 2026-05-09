; DESCRIPTION: Places a yellow line segment connecting (130, 236) to (323, 12).
; PLAN: r0=130(x1), r1=236(y1), r2=323(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 236
LDI r2, 323
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
