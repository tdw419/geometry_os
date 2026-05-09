; DESCRIPTION: Renders a black line between points (58, 32) and (397, 81).
; PLAN: r0=58(x1), r1=32(y1), r2=397(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 32
LDI r2, 397
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
