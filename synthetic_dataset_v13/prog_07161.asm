; DESCRIPTION: Places a yellow line segment connecting (439, 238) to (323, 46).
; PLAN: r0=439(x1), r1=238(y1), r2=323(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 238
LDI r2, 323
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
