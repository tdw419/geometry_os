; DESCRIPTION: Places a green line segment connecting (476, 189) to (483, 93).
; PLAN: r0=476(x1), r1=189(y1), r2=483(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 189
LDI r2, 483
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
