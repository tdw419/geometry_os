; DESCRIPTION: Creates a red circular shape at (173, 197) with radius 46.
; PLAN: r0=173(x), r1=197(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 197
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
