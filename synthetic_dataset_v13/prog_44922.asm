; DESCRIPTION: Draws a black line from (397, 52) to (18, 193).
; PLAN: r0=397(x1), r1=52(y1), r2=18(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 52
LDI r2, 18
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
