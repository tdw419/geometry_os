; DESCRIPTION: Renders a red line between points (34, 73) and (226, 255).
; PLAN: r0=34(x1), r1=73(y1), r2=226(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 73
LDI r2, 226
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
