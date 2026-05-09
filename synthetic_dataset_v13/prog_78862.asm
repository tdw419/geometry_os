; DESCRIPTION: Renders a red line between points (265, 131) and (56, 245).
; PLAN: r0=265(x1), r1=131(y1), r2=56(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 131
LDI r2, 56
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
