; DESCRIPTION: Renders a red line between points (241, 146) and (9, 141).
; PLAN: r0=241(x1), r1=146(y1), r2=9(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 146
LDI r2, 9
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
