; DESCRIPTION: Places a red circle of radius 34 at center (274, 144).
; PLAN: r0=274(x), r1=144(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 144
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
