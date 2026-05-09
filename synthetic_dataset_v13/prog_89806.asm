; DESCRIPTION: Draws a green line from (379, 77) to (397, 248).
; PLAN: r0=379(x1), r1=77(y1), r2=397(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 77
LDI r2, 397
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
