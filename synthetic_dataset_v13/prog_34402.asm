; DESCRIPTION: Places a black 53x85 rectangle at position (354, 149).
; PLAN: r0=354(x), r1=149(y), r2=53(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 149
LDI r2, 53
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
