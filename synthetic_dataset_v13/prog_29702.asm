; DESCRIPTION: Renders a red line between points (188, 42) and (508, 180).
; PLAN: r0=188(x1), r1=42(y1), r2=508(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 42
LDI r2, 508
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
