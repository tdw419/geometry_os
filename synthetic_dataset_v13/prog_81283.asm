; DESCRIPTION: Draws a yellow line from (195, 116) to (399, 157).
; PLAN: r0=195(x1), r1=116(y1), r2=399(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 116
LDI r2, 399
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
