; DESCRIPTION: Places a white 75x24 rectangle at position (239, 116).
; PLAN: r0=239(x), r1=116(y), r2=75(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 116
LDI r2, 75
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
