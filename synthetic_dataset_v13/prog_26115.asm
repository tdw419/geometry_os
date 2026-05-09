; DESCRIPTION: Renders a yellow line between points (116, 129) and (251, 218).
; PLAN: r0=116(x1), r1=129(y1), r2=251(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 129
LDI r2, 251
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
