; DESCRIPTION: Renders a yellow line between points (335, 156) and (360, 36).
; PLAN: r0=335(x1), r1=156(y1), r2=360(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 156
LDI r2, 360
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
