; DESCRIPTION: Renders a red line between points (388, 31) and (434, 245).
; PLAN: r0=388(x1), r1=31(y1), r2=434(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 31
LDI r2, 434
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
