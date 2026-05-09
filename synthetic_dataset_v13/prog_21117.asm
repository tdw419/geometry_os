; DESCRIPTION: Places a green line segment connecting (476, 12) to (217, 216).
; PLAN: r0=476(x1), r1=12(y1), r2=217(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 12
LDI r2, 217
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
