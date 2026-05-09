; DESCRIPTION: Places a green line segment connecting (244, 118) to (178, 71).
; PLAN: r0=244(x1), r1=118(y1), r2=178(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 118
LDI r2, 178
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
