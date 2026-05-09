; DESCRIPTION: Places a red circle of radius 16 at center (382, 71).
; PLAN: r0=382(x), r1=71(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 71
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
