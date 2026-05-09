; DESCRIPTION: Renders a black line between points (116, 123) and (200, 1).
; PLAN: r0=116(x1), r1=123(y1), r2=200(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 123
LDI r2, 200
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
