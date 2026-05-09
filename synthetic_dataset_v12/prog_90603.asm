; DESCRIPTION: Draws a red line from (188, 226) to (74, 119).
; PLAN: r0=188(x1), r1=226(y1), r2=74(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 226
LDI r2, 74
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
