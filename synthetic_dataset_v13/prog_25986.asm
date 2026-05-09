; DESCRIPTION: Places a green line segment connecting (484, 31) to (160, 109).
; PLAN: r0=484(x1), r1=31(y1), r2=160(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 31
LDI r2, 160
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
