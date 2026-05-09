; DESCRIPTION: Places a yellow line segment connecting (416, 167) to (259, 214).
; PLAN: r0=416(x1), r1=167(y1), r2=259(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 167
LDI r2, 259
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
