; DESCRIPTION: Places a black 69x101 rectangle at position (395, 115).
; PLAN: r0=395(x), r1=115(y), r2=69(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 115
LDI r2, 69
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
