; DESCRIPTION: Places a black 100x39 rectangle at position (49, 171).
; PLAN: r0=49(x), r1=171(y), r2=100(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 171
LDI r2, 100
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
