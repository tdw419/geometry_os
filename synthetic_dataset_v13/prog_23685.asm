; DESCRIPTION: Renders a red line between points (397, 227) and (274, 174).
; PLAN: r0=397(x1), r1=227(y1), r2=274(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 227
LDI r2, 274
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
