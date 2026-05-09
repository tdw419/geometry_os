; DESCRIPTION: Places a white 69x83 rectangle at position (123, 157).
; PLAN: r0=123(x), r1=157(y), r2=69(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 157
LDI r2, 69
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
