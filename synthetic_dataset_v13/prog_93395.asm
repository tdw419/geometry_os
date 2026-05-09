; DESCRIPTION: Places a green line segment connecting (380, 87) to (357, 64).
; PLAN: r0=380(x1), r1=87(y1), r2=357(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 87
LDI r2, 357
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
