; DESCRIPTION: Renders a yellow line between points (409, 182) and (152, 104).
; PLAN: r0=409(x1), r1=182(y1), r2=152(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 182
LDI r2, 152
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
