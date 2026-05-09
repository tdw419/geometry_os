; DESCRIPTION: Places a yellow line segment connecting (395, 167) to (67, 168).
; PLAN: r0=395(x1), r1=167(y1), r2=67(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 167
LDI r2, 67
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
