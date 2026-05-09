; DESCRIPTION: Renders a red line between points (152, 4) and (311, 180).
; PLAN: r0=152(x1), r1=4(y1), r2=311(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 4
LDI r2, 311
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
