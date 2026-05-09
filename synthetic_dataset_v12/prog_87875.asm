; DESCRIPTION: Renders a red line between points (70, 76) and (98, 109).
; PLAN: r0=70(x1), r1=76(y1), r2=98(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 76
LDI r2, 98
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
