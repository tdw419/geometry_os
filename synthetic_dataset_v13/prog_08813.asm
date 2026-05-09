; DESCRIPTION: Renders a red line between points (148, 174) and (376, 191).
; PLAN: r0=148(x1), r1=174(y1), r2=376(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 174
LDI r2, 376
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
