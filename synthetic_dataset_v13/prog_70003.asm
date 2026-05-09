; DESCRIPTION: Renders a yellow line between points (306, 159) and (192, 28).
; PLAN: r0=306(x1), r1=159(y1), r2=192(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 159
LDI r2, 192
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
