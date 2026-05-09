; DESCRIPTION: Renders a black line between points (171, 62) and (314, 227).
; PLAN: r0=171(x1), r1=62(y1), r2=314(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 62
LDI r2, 314
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
