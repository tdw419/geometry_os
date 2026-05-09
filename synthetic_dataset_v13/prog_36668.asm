; DESCRIPTION: Places a green line segment connecting (86, 115) to (100, 38).
; PLAN: r0=86(x1), r1=115(y1), r2=100(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 115
LDI r2, 100
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
