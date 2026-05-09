; DESCRIPTION: Places a black line segment connecting (384, 101) to (364, 92).
; PLAN: r0=384(x1), r1=101(y1), r2=364(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 101
LDI r2, 364
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
