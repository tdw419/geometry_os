; DESCRIPTION: Places a black line segment connecting (350, 49) to (486, 83).
; PLAN: r0=350(x1), r1=49(y1), r2=486(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 49
LDI r2, 486
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
