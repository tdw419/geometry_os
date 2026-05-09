; DESCRIPTION: Renders a red line between points (232, 159) and (408, 196).
; PLAN: r0=232(x1), r1=159(y1), r2=408(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 159
LDI r2, 408
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
