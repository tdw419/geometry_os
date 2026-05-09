; DESCRIPTION: Renders a yellow line between points (375, 46) and (474, 155).
; PLAN: r0=375(x1), r1=46(y1), r2=474(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 46
LDI r2, 474
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
