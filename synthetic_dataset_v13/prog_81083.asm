; DESCRIPTION: Places a black line segment connecting (406, 167) to (163, 92).
; PLAN: r0=406(x1), r1=167(y1), r2=163(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 167
LDI r2, 163
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
