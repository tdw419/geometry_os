; DESCRIPTION: Renders a yellow line between points (375, 158) and (404, 125).
; PLAN: r0=375(x1), r1=158(y1), r2=404(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 158
LDI r2, 404
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
