; DESCRIPTION: Draws a purple line from (286, 2) to (38, 194).
; PLAN: r0=286(x1), r1=2(y1), r2=38(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 2
LDI r2, 38
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
