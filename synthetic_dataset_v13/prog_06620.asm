; DESCRIPTION: Places a green line segment connecting (315, 117) to (119, 187).
; PLAN: r0=315(x1), r1=117(y1), r2=119(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 117
LDI r2, 119
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
