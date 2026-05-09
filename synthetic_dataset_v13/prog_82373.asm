; DESCRIPTION: Places a black line segment connecting (397, 11) to (312, 90).
; PLAN: r0=397(x1), r1=11(y1), r2=312(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 11
LDI r2, 312
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
