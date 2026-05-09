; DESCRIPTION: Draws a green line from (397, 211) to (459, 106).
; PLAN: r0=397(x1), r1=211(y1), r2=459(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 211
LDI r2, 459
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
