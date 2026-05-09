; DESCRIPTION: Renders a yellow line between points (121, 250) and (297, 59).
; PLAN: r0=121(x1), r1=250(y1), r2=297(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 250
LDI r2, 297
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
