; DESCRIPTION: Places a cyan 26x88 rectangle at position (282, 53).
; PLAN: r0=282(x), r1=53(y), r2=26(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 53
LDI r2, 26
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
