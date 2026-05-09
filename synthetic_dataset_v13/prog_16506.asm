; DESCRIPTION: Renders a red line between points (506, 176) and (212, 253).
; PLAN: r0=506(x1), r1=176(y1), r2=212(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 176
LDI r2, 212
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
