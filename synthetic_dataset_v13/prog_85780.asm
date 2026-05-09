; DESCRIPTION: Places a white 69x69 rectangle at position (3, 183).
; PLAN: r0=3(x), r1=183(y), r2=69(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 183
LDI r2, 69
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
