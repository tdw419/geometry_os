; DESCRIPTION: Composite: Creates a purple rectangular region at (127, 72) spanning 36 by 101 pixels then Draws a white line from (419, 52) to (454, 119).
; PLAN: r0=127(x), r1=72(y), r2=36(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=52(y1), r7=454(x2), r8=119(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 72
LDI r2, 36
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 52
LDI r7, 454
LDI r8, 119
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
