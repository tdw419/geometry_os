; DESCRIPTION: Places a red circle of radius 29 at center (334, 200).
; PLAN: r0=334(x), r1=200(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 200
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
