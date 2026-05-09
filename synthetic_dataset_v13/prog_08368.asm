; DESCRIPTION: Renders a red line between points (166, 119) and (167, 158).
; PLAN: r0=166(x1), r1=119(y1), r2=167(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 119
LDI r2, 167
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
