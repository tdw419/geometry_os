; DESCRIPTION: Renders a black line between points (397, 233) and (24, 172).
; PLAN: r0=397(x1), r1=233(y1), r2=24(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 233
LDI r2, 24
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
