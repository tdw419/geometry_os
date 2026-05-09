; DESCRIPTION: Renders a red line between points (376, 83) and (40, 173).
; PLAN: r0=376(x1), r1=83(y1), r2=40(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 83
LDI r2, 40
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
