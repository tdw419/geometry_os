; DESCRIPTION: Places a green line segment connecting (11, 121) to (289, 97).
; PLAN: r0=11(x1), r1=121(y1), r2=289(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 121
LDI r2, 289
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
