; DESCRIPTION: Places a red circle of radius 24 at center (324, 83).
; PLAN: r0=324(x), r1=83(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 83
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
