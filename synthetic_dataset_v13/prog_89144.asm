; DESCRIPTION: Places a red circle of radius 28 at center (419, 67).
; PLAN: r0=419(x), r1=67(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 67
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
