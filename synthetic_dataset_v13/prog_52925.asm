; DESCRIPTION: Places a yellow line segment connecting (457, 9) to (38, 186).
; PLAN: r0=457(x1), r1=9(y1), r2=38(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 9
LDI r2, 38
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
