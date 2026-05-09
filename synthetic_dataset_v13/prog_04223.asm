; DESCRIPTION: Places a white 69x76 rectangle at position (25, 49).
; PLAN: r0=25(x), r1=49(y), r2=69(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 49
LDI r2, 69
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
