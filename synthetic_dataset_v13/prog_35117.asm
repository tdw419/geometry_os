; DESCRIPTION: Renders a red line between points (82, 34) and (294, 35).
; PLAN: r0=82(x1), r1=34(y1), r2=294(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 34
LDI r2, 294
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
