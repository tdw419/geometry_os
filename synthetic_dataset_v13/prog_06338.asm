; DESCRIPTION: Places a yellow line segment connecting (486, 53) to (290, 165).
; PLAN: r0=486(x1), r1=53(y1), r2=290(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 53
LDI r2, 290
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
