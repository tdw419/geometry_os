; DESCRIPTION: Places a white 69x61 rectangle at position (416, 22).
; PLAN: r0=416(x), r1=22(y), r2=69(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 22
LDI r2, 69
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
