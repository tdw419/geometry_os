; DESCRIPTION: Places a yellow line segment connecting (323, 237) to (508, 33).
; PLAN: r0=323(x1), r1=237(y1), r2=508(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 237
LDI r2, 508
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
