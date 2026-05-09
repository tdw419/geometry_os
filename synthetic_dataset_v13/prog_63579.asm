; DESCRIPTION: Renders a green line between points (81, 139) and (456, 138).
; PLAN: r0=81(x1), r1=139(y1), r2=456(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 139
LDI r2, 456
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
