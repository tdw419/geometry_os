; DESCRIPTION: Draws a red line from (93, 157) to (225, 15).
; PLAN: r0=93(x1), r1=157(y1), r2=225(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 157
LDI r2, 225
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
