; DESCRIPTION: Places a green line segment connecting (20, 162) to (246, 89).
; PLAN: r0=20(x1), r1=162(y1), r2=246(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 162
LDI r2, 246
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
