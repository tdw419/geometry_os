; DESCRIPTION: Creates a purple circular shape at (347, 173) with radius 41.
; PLAN: r0=347(x), r1=173(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 173
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
