; DESCRIPTION: Renders a yellow line between points (287, 35) and (47, 10).
; PLAN: r0=287(x1), r1=35(y1), r2=47(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 35
LDI r2, 47
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
