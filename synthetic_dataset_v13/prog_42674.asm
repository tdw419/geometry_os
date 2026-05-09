; DESCRIPTION: Draws a red line from (190, 171) to (236, 250).
; PLAN: r0=190(x1), r1=171(y1), r2=236(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 171
LDI r2, 236
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
