; DESCRIPTION: Renders a yellow line between points (397, 219) and (474, 140).
; PLAN: r0=397(x1), r1=219(y1), r2=474(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 219
LDI r2, 474
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
