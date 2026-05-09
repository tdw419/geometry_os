; DESCRIPTION: Renders a yellow line between points (335, 83) and (342, 170).
; PLAN: r0=335(x1), r1=83(y1), r2=342(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 83
LDI r2, 342
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
