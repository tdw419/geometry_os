; DESCRIPTION: Renders a red line between points (6, 66) and (301, 15).
; PLAN: r0=6(x1), r1=66(y1), r2=301(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 66
LDI r2, 301
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
