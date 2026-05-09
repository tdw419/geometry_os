; DESCRIPTION: Renders a yellow line between points (249, 165) and (282, 34).
; PLAN: r0=249(x1), r1=165(y1), r2=282(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 165
LDI r2, 282
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
