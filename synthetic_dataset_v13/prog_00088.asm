; DESCRIPTION: Renders a red line between points (327, 118) and (166, 177).
; PLAN: r0=327(x1), r1=118(y1), r2=166(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 118
LDI r2, 166
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
