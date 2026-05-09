; DESCRIPTION: Renders a yellow line between points (167, 1) and (93, 153).
; PLAN: r0=167(x1), r1=1(y1), r2=93(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 1
LDI r2, 93
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
