; DESCRIPTION: Renders a yellow line between points (31, 104) and (290, 49).
; PLAN: r0=31(x1), r1=104(y1), r2=290(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 104
LDI r2, 290
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
