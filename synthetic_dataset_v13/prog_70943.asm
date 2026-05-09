; DESCRIPTION: Draws a black line from (101, 201) to (397, 83).
; PLAN: r0=101(x1), r1=201(y1), r2=397(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 201
LDI r2, 397
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
