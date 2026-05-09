; DESCRIPTION: Renders a white line between points (367, 204) and (397, 15).
; PLAN: r0=367(x1), r1=204(y1), r2=397(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 204
LDI r2, 397
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
