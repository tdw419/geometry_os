; DESCRIPTION: Renders a red line between points (26, 159) and (321, 32).
; PLAN: r0=26(x1), r1=159(y1), r2=321(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 159
LDI r2, 321
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
