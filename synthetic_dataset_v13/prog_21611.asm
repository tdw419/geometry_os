; DESCRIPTION: Places a yellow line segment connecting (250, 167) to (218, 39).
; PLAN: r0=250(x1), r1=167(y1), r2=218(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 167
LDI r2, 218
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
