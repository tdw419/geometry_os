; DESCRIPTION: Places a yellow line segment connecting (62, 167) to (352, 162).
; PLAN: r0=62(x1), r1=167(y1), r2=352(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 167
LDI r2, 352
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
