; DESCRIPTION: Places a green line segment connecting (387, 62) to (118, 110).
; PLAN: r0=387(x1), r1=62(y1), r2=118(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 62
LDI r2, 118
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
