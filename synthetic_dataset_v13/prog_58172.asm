; DESCRIPTION: Places a green line segment connecting (344, 53) to (221, 123).
; PLAN: r0=344(x1), r1=53(y1), r2=221(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 53
LDI r2, 221
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
