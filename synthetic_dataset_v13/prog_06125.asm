; DESCRIPTION: Places a green line segment connecting (383, 2) to (86, 37).
; PLAN: r0=383(x1), r1=2(y1), r2=86(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 2
LDI r2, 86
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
