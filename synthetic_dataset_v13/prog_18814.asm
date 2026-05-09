; DESCRIPTION: Renders a black line between points (156, 194) and (132, 247).
; PLAN: r0=156(x1), r1=194(y1), r2=132(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 194
LDI r2, 132
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
