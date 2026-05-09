; DESCRIPTION: Creates a orange circular shape at (387, 164) with radius 73.
; PLAN: r0=387(x), r1=164(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 164
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
