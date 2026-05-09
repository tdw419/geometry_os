; DESCRIPTION: Places a red circle of radius 67 at center (167, 80).
; PLAN: r0=167(x), r1=80(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 80
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
