; DESCRIPTION: Draws a red line from (426, 166) to (6, 207).
; PLAN: r0=426(x1), r1=166(y1), r2=6(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 166
LDI r2, 6
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
