; DESCRIPTION: Draws a red line from (37, 76) to (213, 155).
; PLAN: r0=37(x1), r1=76(y1), r2=213(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 76
LDI r2, 213
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
