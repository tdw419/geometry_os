; DESCRIPTION: Places a green line segment connecting (306, 21) to (354, 147).
; PLAN: r0=306(x1), r1=21(y1), r2=354(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 21
LDI r2, 354
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
