; DESCRIPTION: Places a black line segment connecting (289, 135) to (62, 7).
; PLAN: r0=289(x1), r1=135(y1), r2=62(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 135
LDI r2, 62
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
