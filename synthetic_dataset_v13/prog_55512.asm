; DESCRIPTION: Places a yellow 81x53 rectangle at position (43, 49).
; PLAN: r0=43(x), r1=49(y), r2=81(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 49
LDI r2, 81
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
