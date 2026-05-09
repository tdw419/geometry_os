; DESCRIPTION: Draws a red line from (505, 69) to (75, 159).
; PLAN: r0=505(x1), r1=69(y1), r2=75(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 69
LDI r2, 75
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
