; DESCRIPTION: Draws a red line from (375, 177) to (181, 17).
; PLAN: r0=375(x1), r1=177(y1), r2=181(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 177
LDI r2, 181
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
