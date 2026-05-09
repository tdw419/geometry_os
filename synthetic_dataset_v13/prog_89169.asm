; DESCRIPTION: Places a green line segment connecting (505, 53) to (456, 207).
; PLAN: r0=505(x1), r1=53(y1), r2=456(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 53
LDI r2, 456
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
