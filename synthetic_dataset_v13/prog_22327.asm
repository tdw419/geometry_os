; DESCRIPTION: Draws a red line from (341, 29) to (155, 68).
; PLAN: r0=341(x1), r1=29(y1), r2=155(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 29
LDI r2, 155
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
