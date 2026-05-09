; DESCRIPTION: Renders a red line between points (222, 244) and (58, 155).
; PLAN: r0=222(x1), r1=244(y1), r2=58(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 244
LDI r2, 58
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
