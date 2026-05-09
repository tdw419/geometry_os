; DESCRIPTION: Creates a red circular shape at (447, 102) with radius 59.
; PLAN: r0=447(x), r1=102(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 102
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
