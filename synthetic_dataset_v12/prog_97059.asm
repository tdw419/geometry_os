; DESCRIPTION: Draws a yellow line from (121, 25) to (397, 97).
; PLAN: r0=121(x1), r1=25(y1), r2=397(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 25
LDI r2, 397
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
