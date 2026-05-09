; DESCRIPTION: Draws a red line from (480, 199) to (155, 153).
; PLAN: r0=480(x1), r1=199(y1), r2=155(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 199
LDI r2, 155
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
