; DESCRIPTION: Renders a yellow line between points (395, 227) and (25, 172).
; PLAN: r0=395(x1), r1=227(y1), r2=25(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 227
LDI r2, 25
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
