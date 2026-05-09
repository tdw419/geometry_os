; DESCRIPTION: Renders a red line between points (329, 247) and (342, 93).
; PLAN: r0=329(x1), r1=247(y1), r2=342(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 247
LDI r2, 342
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
