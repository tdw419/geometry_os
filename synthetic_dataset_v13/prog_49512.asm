; DESCRIPTION: Places a yellow line segment connecting (313, 165) to (60, 25).
; PLAN: r0=313(x1), r1=165(y1), r2=60(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 165
LDI r2, 60
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
