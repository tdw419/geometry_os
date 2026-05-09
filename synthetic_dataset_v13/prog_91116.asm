; DESCRIPTION: Places a white line segment connecting (455, 199) to (226, 147).
; PLAN: r0=455(x1), r1=199(y1), r2=226(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 199
LDI r2, 226
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
