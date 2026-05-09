; DESCRIPTION: Places a yellow line segment connecting (77, 236) to (383, 156).
; PLAN: r0=77(x1), r1=236(y1), r2=383(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 236
LDI r2, 383
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
