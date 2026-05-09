; DESCRIPTION: Renders a yellow line between points (306, 183) and (220, 139).
; PLAN: r0=306(x1), r1=183(y1), r2=220(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 183
LDI r2, 220
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
