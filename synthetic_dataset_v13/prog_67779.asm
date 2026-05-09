; DESCRIPTION: Composite: Places a red dot at position (101, 137) then Renders a orange line between points (126, 77) and (232, 116).
; PLAN: r0=101(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=126(x1), r6=77(y1), r7=232(x2), r8=116(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 137
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 126
LDI r6, 77
LDI r7, 232
LDI r8, 116
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
