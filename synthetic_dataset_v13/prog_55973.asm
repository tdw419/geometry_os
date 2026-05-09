; DESCRIPTION: Creates a red circular shape at (198, 176) with radius 15.
; PLAN: r0=198(x), r1=176(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 176
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
