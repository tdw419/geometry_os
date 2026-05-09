; DESCRIPTION: Renders a yellow line between points (238, 222) and (149, 169).
; PLAN: r0=238(x1), r1=222(y1), r2=149(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 222
LDI r2, 149
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
