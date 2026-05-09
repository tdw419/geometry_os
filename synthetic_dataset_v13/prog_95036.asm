; DESCRIPTION: Places a red line segment connecting (22, 53) to (476, 231).
; PLAN: r0=22(x1), r1=53(y1), r2=476(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 53
LDI r2, 476
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
