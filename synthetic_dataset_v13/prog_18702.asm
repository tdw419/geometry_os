; DESCRIPTION: Draws a red line from (404, 175) to (90, 159).
; PLAN: r0=404(x1), r1=175(y1), r2=90(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 175
LDI r2, 90
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
