; DESCRIPTION: Places a yellow line segment connecting (476, 126) to (509, 251).
; PLAN: r0=476(x1), r1=126(y1), r2=509(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 126
LDI r2, 509
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
