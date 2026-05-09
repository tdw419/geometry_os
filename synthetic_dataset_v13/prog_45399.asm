; DESCRIPTION: Places a yellow line segment connecting (67, 175) to (165, 230).
; PLAN: r0=67(x1), r1=175(y1), r2=165(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 175
LDI r2, 165
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
