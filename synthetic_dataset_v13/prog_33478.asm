; DESCRIPTION: Places a yellow line segment connecting (117, 148) to (225, 73).
; PLAN: r0=117(x1), r1=148(y1), r2=225(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 148
LDI r2, 225
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
