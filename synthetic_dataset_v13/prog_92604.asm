; DESCRIPTION: Renders a white line between points (397, 157) and (270, 76).
; PLAN: r0=397(x1), r1=157(y1), r2=270(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 157
LDI r2, 270
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
