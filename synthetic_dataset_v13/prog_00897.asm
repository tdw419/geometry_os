; DESCRIPTION: Draws a red line from (185, 142) to (43, 163).
; PLAN: r0=185(x1), r1=142(y1), r2=43(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 142
LDI r2, 43
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
