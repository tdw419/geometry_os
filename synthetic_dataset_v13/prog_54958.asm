; DESCRIPTION: Places a magenta 102x76 rectangle at position (397, 53).
; PLAN: r0=397(x), r1=53(y), r2=102(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 53
LDI r2, 102
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
