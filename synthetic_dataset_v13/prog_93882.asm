; DESCRIPTION: Creates a red circular shape at (192, 173) with radius 76.
; PLAN: r0=192(x), r1=173(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 173
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
