; DESCRIPTION: Draws a red line from (217, 78) to (426, 56).
; PLAN: r0=217(x1), r1=78(y1), r2=426(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 78
LDI r2, 426
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
