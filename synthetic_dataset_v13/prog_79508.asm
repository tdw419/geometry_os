; DESCRIPTION: Renders a yellow line between points (305, 142) and (95, 155).
; PLAN: r0=305(x1), r1=142(y1), r2=95(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 142
LDI r2, 95
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
