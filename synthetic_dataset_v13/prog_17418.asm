; DESCRIPTION: Places a yellow line segment connecting (104, 59) to (76, 177).
; PLAN: r0=104(x1), r1=59(y1), r2=76(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 59
LDI r2, 76
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
