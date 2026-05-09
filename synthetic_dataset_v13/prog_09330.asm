; DESCRIPTION: Renders a yellow line between points (126, 17) and (375, 188).
; PLAN: r0=126(x1), r1=17(y1), r2=375(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 17
LDI r2, 375
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
