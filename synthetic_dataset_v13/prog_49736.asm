; DESCRIPTION: Renders a red line between points (396, 8) and (135, 139).
; PLAN: r0=396(x1), r1=8(y1), r2=135(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 8
LDI r2, 135
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
