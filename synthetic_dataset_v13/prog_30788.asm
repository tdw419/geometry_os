; DESCRIPTION: Places a green line segment connecting (334, 178) to (273, 64).
; PLAN: r0=334(x1), r1=178(y1), r2=273(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 178
LDI r2, 273
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
