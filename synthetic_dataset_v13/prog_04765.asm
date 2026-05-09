; DESCRIPTION: Places a green line segment connecting (273, 112) to (376, 89).
; PLAN: r0=273(x1), r1=112(y1), r2=376(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 112
LDI r2, 376
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
