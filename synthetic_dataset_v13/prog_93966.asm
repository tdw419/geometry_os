; DESCRIPTION: Renders a red line between points (463, 145) and (177, 47).
; PLAN: r0=463(x1), r1=145(y1), r2=177(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 145
LDI r2, 177
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
