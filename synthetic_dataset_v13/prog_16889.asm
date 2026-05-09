; DESCRIPTION: Places a white 69x34 rectangle at position (222, 101).
; PLAN: r0=222(x), r1=101(y), r2=69(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 101
LDI r2, 69
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
