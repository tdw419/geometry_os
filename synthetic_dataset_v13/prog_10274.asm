; DESCRIPTION: Places a yellow line segment connecting (55, 240) to (227, 167).
; PLAN: r0=55(x1), r1=240(y1), r2=227(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 240
LDI r2, 227
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
