; DESCRIPTION: Renders a red line between points (221, 255) and (93, 237).
; PLAN: r0=221(x1), r1=255(y1), r2=93(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 255
LDI r2, 93
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
