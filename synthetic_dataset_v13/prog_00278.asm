; DESCRIPTION: Places a red circle of radius 28 at center (275, 104).
; PLAN: r0=275(x), r1=104(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 104
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
