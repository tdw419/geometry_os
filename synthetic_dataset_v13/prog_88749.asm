; DESCRIPTION: Draws a yellow line from (116, 163) to (397, 9).
; PLAN: r0=116(x1), r1=163(y1), r2=397(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 163
LDI r2, 397
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
