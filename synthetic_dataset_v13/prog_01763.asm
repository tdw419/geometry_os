; DESCRIPTION: Renders a red line between points (75, 142) and (211, 31).
; PLAN: r0=75(x1), r1=142(y1), r2=211(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 142
LDI r2, 211
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
