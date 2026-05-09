; DESCRIPTION: Places a red circle of radius 54 at center (334, 166).
; PLAN: r0=334(x), r1=166(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 166
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
