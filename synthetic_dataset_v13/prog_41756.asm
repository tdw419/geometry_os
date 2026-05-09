; DESCRIPTION: Draws a yellow line from (247, 116) to (389, 183).
; PLAN: r0=247(x1), r1=116(y1), r2=389(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 116
LDI r2, 389
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
