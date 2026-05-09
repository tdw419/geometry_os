; DESCRIPTION: Places a black line segment connecting (83, 15) to (362, 130).
; PLAN: r0=83(x1), r1=15(y1), r2=362(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 15
LDI r2, 362
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
