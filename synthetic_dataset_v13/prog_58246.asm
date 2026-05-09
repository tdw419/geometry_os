; DESCRIPTION: Renders a yellow line between points (210, 78) and (247, 93).
; PLAN: r0=210(x1), r1=78(y1), r2=247(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 78
LDI r2, 247
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
