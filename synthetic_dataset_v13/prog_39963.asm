; DESCRIPTION: Renders a green line between points (121, 105) and (176, 78).
; PLAN: r0=121(x1), r1=105(y1), r2=176(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 105
LDI r2, 176
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
