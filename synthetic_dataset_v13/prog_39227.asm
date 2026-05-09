; DESCRIPTION: Places a yellow line segment connecting (47, 86) to (119, 164).
; PLAN: r0=47(x1), r1=86(y1), r2=119(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 86
LDI r2, 119
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
