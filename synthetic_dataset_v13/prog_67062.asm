; DESCRIPTION: Renders a red line between points (187, 65) and (311, 36).
; PLAN: r0=187(x1), r1=65(y1), r2=311(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 65
LDI r2, 311
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
