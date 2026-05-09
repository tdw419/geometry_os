; DESCRIPTION: Creates a orange circular shape at (171, 136) with radius 79.
; PLAN: r0=171(x), r1=136(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 136
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
