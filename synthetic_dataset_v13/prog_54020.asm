; DESCRIPTION: Renders a red line between points (397, 81) and (37, 148).
; PLAN: r0=397(x1), r1=81(y1), r2=37(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 81
LDI r2, 37
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
