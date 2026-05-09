; DESCRIPTION: Places a black line segment connecting (177, 23) to (114, 15).
; PLAN: r0=177(x1), r1=23(y1), r2=114(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 23
LDI r2, 114
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
