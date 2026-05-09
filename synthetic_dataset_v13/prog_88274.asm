; DESCRIPTION: Places a green line segment connecting (88, 0) to (167, 244).
; PLAN: r0=88(x1), r1=0(y1), r2=167(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 0
LDI r2, 167
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
