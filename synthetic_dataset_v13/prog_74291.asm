; DESCRIPTION: Draws a red line from (448, 3) to (499, 247).
; PLAN: r0=448(x1), r1=3(y1), r2=499(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 3
LDI r2, 499
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
