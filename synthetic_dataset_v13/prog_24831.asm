; DESCRIPTION: Renders a red line between points (268, 89) and (408, 25).
; PLAN: r0=268(x1), r1=89(y1), r2=408(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 89
LDI r2, 408
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
