; DESCRIPTION: Renders a red line between points (47, 49) and (223, 28).
; PLAN: r0=47(x1), r1=49(y1), r2=223(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 49
LDI r2, 223
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
