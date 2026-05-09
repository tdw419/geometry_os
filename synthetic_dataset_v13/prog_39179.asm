; DESCRIPTION: Places a magenta 14x53 rectangle at position (18, 129).
; PLAN: r0=18(x), r1=129(y), r2=14(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 129
LDI r2, 14
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
