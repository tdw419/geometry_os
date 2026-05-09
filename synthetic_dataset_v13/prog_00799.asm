; DESCRIPTION: Places a red circle of radius 48 at center (233, 170).
; PLAN: r0=233(x), r1=170(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 170
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
