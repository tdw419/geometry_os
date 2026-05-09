; DESCRIPTION: Renders a red line between points (473, 221) and (232, 138).
; PLAN: r0=473(x1), r1=221(y1), r2=232(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 221
LDI r2, 232
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
