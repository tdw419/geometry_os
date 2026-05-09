; DESCRIPTION: Renders a red line between points (179, 113) and (433, 230).
; PLAN: r0=179(x1), r1=113(y1), r2=433(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 113
LDI r2, 433
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
