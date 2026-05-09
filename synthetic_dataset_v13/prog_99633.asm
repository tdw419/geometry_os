; DESCRIPTION: Renders a yellow line between points (306, 160) and (397, 34).
; PLAN: r0=306(x1), r1=160(y1), r2=397(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 160
LDI r2, 397
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
