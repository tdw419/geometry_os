; DESCRIPTION: Renders a black line between points (38, 165) and (264, 188).
; PLAN: r0=38(x1), r1=165(y1), r2=264(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 165
LDI r2, 264
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
