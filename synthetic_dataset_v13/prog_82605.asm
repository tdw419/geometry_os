; DESCRIPTION: Places a black line segment connecting (436, 133) to (364, 64).
; PLAN: r0=436(x1), r1=133(y1), r2=364(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 133
LDI r2, 364
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
