; DESCRIPTION: Places a green line segment connecting (119, 167) to (456, 79).
; PLAN: r0=119(x1), r1=167(y1), r2=456(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 167
LDI r2, 456
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
