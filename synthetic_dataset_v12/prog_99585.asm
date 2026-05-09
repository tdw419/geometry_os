; DESCRIPTION: Places a purple 53x39 rectangle at position (86, 43).
; PLAN: r0=86(x), r1=43(y), r2=53(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 43
LDI r2, 53
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
