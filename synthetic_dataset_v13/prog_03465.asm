; DESCRIPTION: Draws a red line from (39, 159) to (466, 35).
; PLAN: r0=39(x1), r1=159(y1), r2=466(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 159
LDI r2, 466
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
