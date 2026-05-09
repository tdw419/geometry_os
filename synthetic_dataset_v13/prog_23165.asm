; DESCRIPTION: Places a green line segment connecting (367, 68) to (88, 118).
; PLAN: r0=367(x1), r1=68(y1), r2=88(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 68
LDI r2, 88
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
