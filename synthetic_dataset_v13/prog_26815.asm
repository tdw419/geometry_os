; DESCRIPTION: Renders a yellow line between points (222, 180) and (81, 43).
; PLAN: r0=222(x1), r1=180(y1), r2=81(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 180
LDI r2, 81
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
