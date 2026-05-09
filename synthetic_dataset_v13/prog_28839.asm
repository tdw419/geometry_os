; DESCRIPTION: Renders a red line between points (6, 226) and (374, 233).
; PLAN: r0=6(x1), r1=226(y1), r2=374(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 226
LDI r2, 374
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
