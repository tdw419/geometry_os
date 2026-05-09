; DESCRIPTION: Renders a white line between points (246, 13) and (397, 76).
; PLAN: r0=246(x1), r1=13(y1), r2=397(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 13
LDI r2, 397
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
