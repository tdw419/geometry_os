; DESCRIPTION: Renders a red line between points (30, 29) and (59, 179).
; PLAN: r0=30(x1), r1=29(y1), r2=59(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 29
LDI r2, 59
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
