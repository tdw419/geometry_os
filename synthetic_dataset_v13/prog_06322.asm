; DESCRIPTION: Renders a red line between points (376, 144) and (425, 169).
; PLAN: r0=376(x1), r1=144(y1), r2=425(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 144
LDI r2, 425
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
