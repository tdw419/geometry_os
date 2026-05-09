; DESCRIPTION: Renders a yellow line between points (173, 81) and (507, 93).
; PLAN: r0=173(x1), r1=81(y1), r2=507(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 81
LDI r2, 507
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
