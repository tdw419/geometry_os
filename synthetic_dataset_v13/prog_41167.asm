; DESCRIPTION: Places a green line segment connecting (357, 134) to (133, 16).
; PLAN: r0=357(x1), r1=134(y1), r2=133(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 134
LDI r2, 133
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
