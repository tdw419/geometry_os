; DESCRIPTION: Renders a yellow line between points (78, 75) and (397, 214).
; PLAN: r0=78(x1), r1=75(y1), r2=397(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 75
LDI r2, 397
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
