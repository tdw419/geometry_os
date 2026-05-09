; DESCRIPTION: Creates a white circular shape at (392, 171) with radius 41.
; PLAN: r0=392(x), r1=171(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 171
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
