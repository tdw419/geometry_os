; DESCRIPTION: Places a green line segment connecting (476, 98) to (437, 108).
; PLAN: r0=476(x1), r1=98(y1), r2=437(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 98
LDI r2, 437
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
