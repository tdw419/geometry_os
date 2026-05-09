; DESCRIPTION: Renders a white line between points (397, 244) and (174, 181).
; PLAN: r0=397(x1), r1=244(y1), r2=174(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 244
LDI r2, 174
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
