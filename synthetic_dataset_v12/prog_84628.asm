; DESCRIPTION: Renders a red line between points (232, 66) and (25, 195).
; PLAN: r0=232(x1), r1=66(y1), r2=25(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 66
LDI r2, 25
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
