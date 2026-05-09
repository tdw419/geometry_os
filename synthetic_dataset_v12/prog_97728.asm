; DESCRIPTION: Draws a red line from (226, 185) to (227, 40).
; PLAN: r0=226(x1), r1=185(y1), r2=227(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 185
LDI r2, 227
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
