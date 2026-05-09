; DESCRIPTION: Renders a yellow line between points (78, 53) and (153, 255).
; PLAN: r0=78(x1), r1=53(y1), r2=153(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 53
LDI r2, 153
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
