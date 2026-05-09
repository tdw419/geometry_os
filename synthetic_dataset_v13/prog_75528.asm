; DESCRIPTION: Creates a red circular shape at (339, 198) with radius 51.
; PLAN: r0=339(x), r1=198(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 198
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
