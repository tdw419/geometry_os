; DESCRIPTION: Draws a yellow line from (358, 116) to (12, 17).
; PLAN: r0=358(x1), r1=116(y1), r2=12(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 116
LDI r2, 12
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
