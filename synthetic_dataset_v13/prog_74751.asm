; DESCRIPTION: Places a green line segment connecting (63, 92) to (383, 3).
; PLAN: r0=63(x1), r1=92(y1), r2=383(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 92
LDI r2, 383
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
