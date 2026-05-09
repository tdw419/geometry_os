; DESCRIPTION: Draws a red line from (358, 114) to (397, 129).
; PLAN: r0=358(x1), r1=114(y1), r2=397(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 114
LDI r2, 397
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
