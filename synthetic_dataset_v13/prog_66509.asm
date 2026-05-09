; DESCRIPTION: Renders a green line between points (397, 251) and (474, 32).
; PLAN: r0=397(x1), r1=251(y1), r2=474(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 251
LDI r2, 474
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
