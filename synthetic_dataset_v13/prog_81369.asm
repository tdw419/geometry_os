; DESCRIPTION: Places a green line segment connecting (98, 102) to (419, 8).
; PLAN: r0=98(x1), r1=102(y1), r2=419(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 102
LDI r2, 419
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
