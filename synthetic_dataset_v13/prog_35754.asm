; DESCRIPTION: Renders a yellow line between points (226, 50) and (78, 139).
; PLAN: r0=226(x1), r1=50(y1), r2=78(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 50
LDI r2, 78
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
