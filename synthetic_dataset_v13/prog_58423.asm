; DESCRIPTION: Places a green line segment connecting (162, 32) to (37, 53).
; PLAN: r0=162(x1), r1=32(y1), r2=37(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 32
LDI r2, 37
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
