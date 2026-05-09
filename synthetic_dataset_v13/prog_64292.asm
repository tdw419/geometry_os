; DESCRIPTION: Renders a red line between points (149, 214) and (62, 4).
; PLAN: r0=149(x1), r1=214(y1), r2=62(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 214
LDI r2, 62
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
