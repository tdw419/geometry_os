; DESCRIPTION: Places a yellow line segment connecting (227, 178) to (264, 187).
; PLAN: r0=227(x1), r1=178(y1), r2=264(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 178
LDI r2, 264
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
