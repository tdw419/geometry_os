; DESCRIPTION: Renders a red line between points (497, 137) and (324, 138).
; PLAN: r0=497(x1), r1=137(y1), r2=324(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 137
LDI r2, 324
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
