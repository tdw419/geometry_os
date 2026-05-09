; DESCRIPTION: Places a yellow line segment connecting (250, 229) to (378, 202).
; PLAN: r0=250(x1), r1=229(y1), r2=378(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 229
LDI r2, 378
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
