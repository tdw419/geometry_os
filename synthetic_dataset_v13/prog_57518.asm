; DESCRIPTION: Creates a red circular shape at (173, 83) with radius 29.
; PLAN: r0=173(x), r1=83(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 83
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
