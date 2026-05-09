; DESCRIPTION: Draws a yellow line from (397, 248) to (107, 165).
; PLAN: r0=397(x1), r1=248(y1), r2=107(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 248
LDI r2, 107
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
