; DESCRIPTION: Places a red circle of radius 61 at center (136, 138).
; PLAN: r0=136(x), r1=138(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 138
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
