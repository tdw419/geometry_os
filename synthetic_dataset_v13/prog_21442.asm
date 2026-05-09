; DESCRIPTION: Places a yellow 43x49 rectangle at position (45, 53).
; PLAN: r0=45(x), r1=53(y), r2=43(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 53
LDI r2, 43
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
