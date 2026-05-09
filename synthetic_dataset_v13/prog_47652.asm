; DESCRIPTION: Renders a yellow line between points (84, 106) and (438, 139).
; PLAN: r0=84(x1), r1=106(y1), r2=438(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 106
LDI r2, 438
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
