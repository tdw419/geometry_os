; DESCRIPTION: Creates a orange circular shape at (197, 103) with radius 79.
; PLAN: r0=197(x), r1=103(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 103
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
