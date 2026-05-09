; DESCRIPTION: Draws a red line from (332, 155) to (213, 56).
; PLAN: r0=332(x1), r1=155(y1), r2=213(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 155
LDI r2, 213
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
