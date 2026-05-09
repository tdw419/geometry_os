; DESCRIPTION: Renders a red line between points (281, 93) and (349, 75).
; PLAN: r0=281(x1), r1=93(y1), r2=349(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 93
LDI r2, 349
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
