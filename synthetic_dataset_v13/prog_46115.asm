; DESCRIPTION: Draws a red line from (54, 56) to (338, 148).
; PLAN: r0=54(x1), r1=56(y1), r2=338(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 56
LDI r2, 338
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
