; DESCRIPTION: Renders a yellow line between points (472, 134) and (287, 239).
; PLAN: r0=472(x1), r1=134(y1), r2=287(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 134
LDI r2, 287
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
