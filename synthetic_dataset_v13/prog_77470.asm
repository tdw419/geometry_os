; DESCRIPTION: Renders a yellow line between points (139, 38) and (28, 186).
; PLAN: r0=139(x1), r1=38(y1), r2=28(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 38
LDI r2, 28
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
