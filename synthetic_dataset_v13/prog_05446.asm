; DESCRIPTION: Renders a green line between points (397, 34) and (388, 118).
; PLAN: r0=397(x1), r1=34(y1), r2=388(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 34
LDI r2, 388
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
