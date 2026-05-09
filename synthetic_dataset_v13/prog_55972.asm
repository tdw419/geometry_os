; DESCRIPTION: Places a green line segment connecting (338, 18) to (156, 115).
; PLAN: r0=338(x1), r1=18(y1), r2=156(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 18
LDI r2, 156
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
