; DESCRIPTION: Renders a red line between points (394, 81) and (109, 163).
; PLAN: r0=394(x1), r1=81(y1), r2=109(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 81
LDI r2, 109
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
