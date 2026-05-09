; DESCRIPTION: Renders a black line between points (463, 11) and (156, 253).
; PLAN: r0=463(x1), r1=11(y1), r2=156(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 11
LDI r2, 156
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
