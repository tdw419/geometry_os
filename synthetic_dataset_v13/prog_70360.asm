; DESCRIPTION: Renders a red line between points (292, 37) and (397, 108).
; PLAN: r0=292(x1), r1=37(y1), r2=397(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 37
LDI r2, 397
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
