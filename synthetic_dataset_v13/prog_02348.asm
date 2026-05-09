; DESCRIPTION: Draws a red line from (334, 2) to (249, 181).
; PLAN: r0=334(x1), r1=2(y1), r2=249(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 2
LDI r2, 249
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
