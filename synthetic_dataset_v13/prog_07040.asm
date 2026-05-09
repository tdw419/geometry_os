; DESCRIPTION: Places a yellow line segment connecting (167, 76) to (34, 50).
; PLAN: r0=167(x1), r1=76(y1), r2=34(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 76
LDI r2, 34
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
