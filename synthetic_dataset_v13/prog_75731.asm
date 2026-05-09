; DESCRIPTION: Places a yellow line segment connecting (335, 164) to (347, 99).
; PLAN: r0=335(x1), r1=164(y1), r2=347(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 164
LDI r2, 347
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
