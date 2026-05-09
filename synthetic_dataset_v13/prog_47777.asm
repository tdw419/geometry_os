; DESCRIPTION: Renders a red line between points (462, 36) and (420, 255).
; PLAN: r0=462(x1), r1=36(y1), r2=420(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 36
LDI r2, 420
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
