; DESCRIPTION: Places a white 26x42 rectangle at position (204, 53).
; PLAN: r0=204(x), r1=53(y), r2=26(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 53
LDI r2, 26
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
