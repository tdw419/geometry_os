; DESCRIPTION: Renders a red line between points (120, 188) and (248, 8).
; PLAN: r0=120(x1), r1=188(y1), r2=248(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 188
LDI r2, 248
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
