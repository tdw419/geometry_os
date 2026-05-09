; DESCRIPTION: Places a red circle of radius 71 at center (185, 136).
; PLAN: r0=185(x), r1=136(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 136
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
