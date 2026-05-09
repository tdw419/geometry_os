; DESCRIPTION: Renders a red line between points (143, 9) and (19, 100).
; PLAN: r0=143(x1), r1=9(y1), r2=19(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 9
LDI r2, 19
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
