; DESCRIPTION: Places a cyan 58x114 rectangle at position (282, 101).
; PLAN: r0=282(x), r1=101(y), r2=58(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 101
LDI r2, 58
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
