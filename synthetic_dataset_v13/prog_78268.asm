; DESCRIPTION: Renders a red line between points (292, 210) and (301, 59).
; PLAN: r0=292(x1), r1=210(y1), r2=301(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 210
LDI r2, 301
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
