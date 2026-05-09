; DESCRIPTION: Places a green line segment connecting (469, 53) to (412, 35).
; PLAN: r0=469(x1), r1=53(y1), r2=412(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 53
LDI r2, 412
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
