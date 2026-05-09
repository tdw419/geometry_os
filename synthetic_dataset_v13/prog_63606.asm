; DESCRIPTION: Places a red line segment connecting (129, 207) to (241, 198).
; PLAN: r0=129(x1), r1=207(y1), r2=241(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 207
LDI r2, 241
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
