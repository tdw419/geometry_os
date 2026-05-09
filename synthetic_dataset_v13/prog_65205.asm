; DESCRIPTION: Renders a yellow line between points (49, 101) and (168, 34).
; PLAN: r0=49(x1), r1=101(y1), r2=168(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 101
LDI r2, 168
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
