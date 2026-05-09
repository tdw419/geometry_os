; DESCRIPTION: Renders a yellow line between points (360, 99) and (159, 96).
; PLAN: r0=360(x1), r1=99(y1), r2=159(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 99
LDI r2, 159
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
