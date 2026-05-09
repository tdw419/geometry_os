; DESCRIPTION: Renders a yellow line between points (375, 47) and (204, 220).
; PLAN: r0=375(x1), r1=47(y1), r2=204(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 47
LDI r2, 204
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
