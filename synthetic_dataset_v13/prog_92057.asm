; DESCRIPTION: Renders a white line between points (397, 214) and (137, 148).
; PLAN: r0=397(x1), r1=214(y1), r2=137(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 214
LDI r2, 137
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
