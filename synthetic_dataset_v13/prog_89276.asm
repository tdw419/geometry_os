; DESCRIPTION: Places a green line segment connecting (198, 62) to (419, 0).
; PLAN: r0=198(x1), r1=62(y1), r2=419(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 62
LDI r2, 419
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
