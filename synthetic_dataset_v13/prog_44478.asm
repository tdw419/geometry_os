; DESCRIPTION: Renders a red line between points (131, 245) and (339, 184).
; PLAN: r0=131(x1), r1=245(y1), r2=339(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 245
LDI r2, 339
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
