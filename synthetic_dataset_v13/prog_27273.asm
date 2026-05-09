; DESCRIPTION: Renders a yellow line between points (135, 102) and (347, 106).
; PLAN: r0=135(x1), r1=102(y1), r2=347(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 102
LDI r2, 347
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
