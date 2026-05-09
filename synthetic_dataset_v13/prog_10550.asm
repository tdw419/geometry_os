; DESCRIPTION: Draws a red line from (151, 19) to (385, 9).
; PLAN: r0=151(x1), r1=19(y1), r2=385(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 19
LDI r2, 385
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
