; DESCRIPTION: Places a green line segment connecting (438, 246) to (221, 99).
; PLAN: r0=438(x1), r1=246(y1), r2=221(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 246
LDI r2, 221
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
