; DESCRIPTION: Renders a red line between points (506, 79) and (397, 197).
; PLAN: r0=506(x1), r1=79(y1), r2=397(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 79
LDI r2, 397
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
