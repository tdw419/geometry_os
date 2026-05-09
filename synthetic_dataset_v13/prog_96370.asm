; DESCRIPTION: Places a yellow line segment connecting (412, 141) to (24, 141).
; PLAN: r0=412(x1), r1=141(y1), r2=24(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 141
LDI r2, 24
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
