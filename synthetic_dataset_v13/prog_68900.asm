; DESCRIPTION: Renders a red line between points (204, 42) and (411, 4).
; PLAN: r0=204(x1), r1=42(y1), r2=411(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 42
LDI r2, 411
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
