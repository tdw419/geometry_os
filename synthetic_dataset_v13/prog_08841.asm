; DESCRIPTION: Places a green line segment connecting (23, 53) to (57, 64).
; PLAN: r0=23(x1), r1=53(y1), r2=57(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 53
LDI r2, 57
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
