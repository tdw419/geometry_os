; DESCRIPTION: Renders a red line between points (53, 35) and (81, 44).
; PLAN: r0=53(x1), r1=35(y1), r2=81(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 35
LDI r2, 81
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
