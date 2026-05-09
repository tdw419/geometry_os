; DESCRIPTION: Renders a red line between points (12, 159) and (74, 202).
; PLAN: r0=12(x1), r1=159(y1), r2=74(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 159
LDI r2, 74
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
