; DESCRIPTION: Renders a yellow line between points (397, 51) and (272, 34).
; PLAN: r0=397(x1), r1=51(y1), r2=272(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 51
LDI r2, 272
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
