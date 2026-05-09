; DESCRIPTION: Draws a red line from (335, 235) to (420, 165).
; PLAN: r0=335(x1), r1=235(y1), r2=420(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 235
LDI r2, 420
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
