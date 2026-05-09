; DESCRIPTION: Renders a black line between points (408, 225) and (304, 185).
; PLAN: r0=408(x1), r1=225(y1), r2=304(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 225
LDI r2, 304
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
