; DESCRIPTION: Places a white 24x62 rectangle at position (461, 88).
; PLAN: r0=461(x), r1=88(y), r2=24(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 88
LDI r2, 24
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
