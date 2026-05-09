; DESCRIPTION: Places a green line segment connecting (438, 134) to (76, 251).
; PLAN: r0=438(x1), r1=134(y1), r2=76(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 134
LDI r2, 76
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
