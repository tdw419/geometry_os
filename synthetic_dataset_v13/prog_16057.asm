; DESCRIPTION: Places a red line segment connecting (218, 101) to (425, 211).
; PLAN: r0=218(x1), r1=101(y1), r2=425(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 101
LDI r2, 425
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
