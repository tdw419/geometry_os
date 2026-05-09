; DESCRIPTION: Places a red circle of radius 49 at center (354, 83).
; PLAN: r0=354(x), r1=83(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 83
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
