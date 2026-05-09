; DESCRIPTION: Places a white 53x35 rectangle at position (134, 2).
; PLAN: r0=134(x), r1=2(y), r2=53(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 2
LDI r2, 53
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
