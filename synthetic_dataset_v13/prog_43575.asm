; DESCRIPTION: Places a yellow 53x14 rectangle at position (15, 61).
; PLAN: r0=15(x), r1=61(y), r2=53(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 61
LDI r2, 53
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
