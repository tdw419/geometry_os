; DESCRIPTION: Renders a green line between points (144, 98) and (461, 139).
; PLAN: r0=144(x1), r1=98(y1), r2=461(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 98
LDI r2, 461
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
