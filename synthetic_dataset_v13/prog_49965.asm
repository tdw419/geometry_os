; DESCRIPTION: Renders a yellow line between points (159, 205) and (374, 74).
; PLAN: r0=159(x1), r1=205(y1), r2=374(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 205
LDI r2, 374
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
