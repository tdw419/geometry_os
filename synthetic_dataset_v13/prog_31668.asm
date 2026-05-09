; DESCRIPTION: Places a white 72x114 rectangle at position (239, 105).
; PLAN: r0=239(x), r1=105(y), r2=72(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 105
LDI r2, 72
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
