; DESCRIPTION: Renders a yellow line between points (194, 30) and (285, 14).
; PLAN: r0=194(x1), r1=30(y1), r2=285(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 30
LDI r2, 285
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
