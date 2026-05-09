; DESCRIPTION: Renders a red line between points (156, 175) and (82, 4).
; PLAN: r0=156(x1), r1=175(y1), r2=82(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 175
LDI r2, 82
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
