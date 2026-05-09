; DESCRIPTION: Draws a red line from (145, 111) to (9, 181).
; PLAN: r0=145(x1), r1=111(y1), r2=9(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 111
LDI r2, 9
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
