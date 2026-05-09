; DESCRIPTION: Places a black line segment connecting (137, 8) to (319, 19).
; PLAN: r0=137(x1), r1=8(y1), r2=319(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 8
LDI r2, 319
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
