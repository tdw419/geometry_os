; DESCRIPTION: Draws a purple line from (88, 221) to (226, 245).
; PLAN: r0=88(x1), r1=221(y1), r2=226(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 221
LDI r2, 226
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
