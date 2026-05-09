; DESCRIPTION: Renders a red line between points (255, 165) and (372, 147).
; PLAN: r0=255(x1), r1=165(y1), r2=372(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 165
LDI r2, 372
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
