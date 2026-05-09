; DESCRIPTION: Places a purple 109x78 rectangle at position (268, 53).
; PLAN: r0=268(x), r1=53(y), r2=109(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 53
LDI r2, 109
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
