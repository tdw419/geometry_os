; DESCRIPTION: Places a black line segment connecting (287, 57) to (289, 240).
; PLAN: r0=287(x1), r1=57(y1), r2=289(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 57
LDI r2, 289
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
