; DESCRIPTION: Places a white 105x103 rectangle at position (339, 136).
; PLAN: r0=339(x), r1=136(y), r2=105(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 136
LDI r2, 105
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
