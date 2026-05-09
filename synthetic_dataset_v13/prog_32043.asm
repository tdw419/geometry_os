; DESCRIPTION: Places a green line segment connecting (483, 107) to (157, 101).
; PLAN: r0=483(x1), r1=107(y1), r2=157(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 107
LDI r2, 157
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
