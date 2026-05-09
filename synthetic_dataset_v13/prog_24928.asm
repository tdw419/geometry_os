; DESCRIPTION: Draws a red line from (475, 109) to (436, 159).
; PLAN: r0=475(x1), r1=109(y1), r2=436(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 109
LDI r2, 436
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
