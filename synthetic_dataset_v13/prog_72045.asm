; DESCRIPTION: Draws a yellow line from (465, 183) to (403, 212).
; PLAN: r0=465(x1), r1=183(y1), r2=403(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 183
LDI r2, 403
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
