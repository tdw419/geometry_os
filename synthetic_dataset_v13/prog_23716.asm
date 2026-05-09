; DESCRIPTION: Places a black 56x26 rectangle at position (149, 53).
; PLAN: r0=149(x), r1=53(y), r2=56(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 53
LDI r2, 56
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
