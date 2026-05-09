; DESCRIPTION: Places a white 26x118 rectangle at position (299, 122).
; PLAN: r0=299(x), r1=122(y), r2=26(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 122
LDI r2, 26
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
