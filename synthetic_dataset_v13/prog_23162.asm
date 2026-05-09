; DESCRIPTION: Places a yellow line segment connecting (167, 29) to (176, 170).
; PLAN: r0=167(x1), r1=29(y1), r2=176(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 29
LDI r2, 176
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
