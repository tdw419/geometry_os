; DESCRIPTION: Places a black 53x98 rectangle at position (102, 8).
; PLAN: r0=102(x), r1=8(y), r2=53(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 8
LDI r2, 53
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
