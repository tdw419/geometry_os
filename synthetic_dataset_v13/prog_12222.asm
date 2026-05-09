; DESCRIPTION: Renders a blue line between points (397, 174) and (19, 0).
; PLAN: r0=397(x1), r1=174(y1), r2=19(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 174
LDI r2, 19
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
