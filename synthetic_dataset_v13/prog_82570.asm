; DESCRIPTION: Renders a red line between points (268, 24) and (75, 170).
; PLAN: r0=268(x1), r1=24(y1), r2=75(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 24
LDI r2, 75
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
