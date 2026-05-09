; DESCRIPTION: Renders a green line between points (232, 69) and (52, 139).
; PLAN: r0=232(x1), r1=69(y1), r2=52(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 69
LDI r2, 52
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
