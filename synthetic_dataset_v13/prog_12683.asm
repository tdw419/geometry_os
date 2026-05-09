; DESCRIPTION: Places a yellow line segment connecting (11, 104) to (191, 153).
; PLAN: r0=11(x1), r1=104(y1), r2=191(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 104
LDI r2, 191
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
