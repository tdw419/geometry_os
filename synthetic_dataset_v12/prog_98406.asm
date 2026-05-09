; DESCRIPTION: Places a green line segment connecting (236, 47) to (88, 100).
; PLAN: r0=236(x1), r1=47(y1), r2=88(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 47
LDI r2, 88
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
